#!/usr/bin/env bats

load helpers

function setup() {
	setup_test
}

function teardown() {
    cleanup_test
}

# 1. test running with loading the default apparmor profile.
# test that we can run with the default apparmor profile which will not block touching a file in `.`
@test "load default apparmor profile and run a container with it" {
    # this test requires apparmor, so skip this test if apparmor is not enabled.
    enabled=$(is_apparmor_enabled)
    if [[ "$enabled" -eq 0 ]]; then
        skip "skip this test since apparmor is not enabled."
    fi
    # apparmor inside containers can be problematic, because they mainly
    # interact with the host system when running privileged
    if [[ "$CI" == "true" ]]; then
        skip "container tests don't support apparmor"
    fi

    start_crio

    sed -e 's/%VALUE%/runtime\/default/g' "$TESTDATA"/sandbox_config_apparmor.json > "$TESTDIR"/apparmor1.json

    run crictl runp "$TESTDIR"/apparmor1.json
    echo "$output"
    [ "$status" -eq 0 ]
    pod_id="$output"
    run crictl create "$pod_id" "$TESTDATA"/container_redis.json "$TESTDIR"/apparmor1.json
    echo "$output"
    [ "$status" -eq 0 ]
    ctr_id="$output"
    run crictl exec --sync "$ctr_id" touch test.txt
    echo "$output"
    [ "$status" -eq 0 ]
}

# 2. test running with loading a specific apparmor profile as crio default apparmor profile.
# test that we can run with a specific apparmor profile which will block touching a file in `.` as crio default apparmor profile.
@test "load a specific apparmor profile as default apparmor and run a container with it" {
    # this test requires apparmor, so skip this test if apparmor is not enabled.
    enabled=$(is_apparmor_enabled)
    if [[ "$enabled" -eq 0 ]]; then
        skip "skip this test since apparmor is not enabled."
    fi
    if [[ "$CI" == "true" ]]; then
        skip "container tests don't support apparmor"
    fi

    load_apparmor_profile "$APPARMOR_TEST_PROFILE_PATH"
    start_crio "" "$APPARMOR_TEST_PROFILE_NAME"

    sed -e 's/%VALUE%/apparmor-test-deny-write/g' "$TESTDATA"/sandbox_config_apparmor.json > "$TESTDIR"/apparmor2.json
    sed -e 's/%VALUE%/apparmor-test-deny-write/g' "$TESTDATA"/container_redis_apparmor.json > "$TESTDIR"/apparmor_container2.json

    run crictl runp "$TESTDIR"/apparmor2.json
    echo "$output"
    [ "$status" -eq 0 ]
    pod_id="$output"
    run crictl create "$pod_id" "$TESTDIR"/apparmor_container2.json "$TESTDIR"/apparmor2.json
    echo "$output"
    [ "$status" -eq 0 ]
    ctr_id="$output"
    run crictl exec --sync "$ctr_id" touch test.txt
    echo "$output"
    [[ "$output" =~ "Permission denied" ]]

    remove_apparmor_profile "$APPARMOR_TEST_PROFILE_PATH"
}

# 3. test running with loading a specific apparmor profile but not as crio default apparmor profile.
# test that we can run with a specific apparmor profile which will block touching a file in `.`
@test "load default apparmor profile and run a container with another apparmor profile" {
    # this test requires apparmor, so skip this test if apparmor is not enabled.
    enabled=$(is_apparmor_enabled)
    if [[ "$enabled" -eq 0 ]]; then
        skip "skip this test since apparmor is not enabled."
    fi
    if [[ "$CI" == "true" ]]; then
        skip "container tests don't support apparmor"
    fi

    load_apparmor_profile "$APPARMOR_TEST_PROFILE_PATH"
    start_crio

    sed -e 's/%VALUE%/apparmor-test-deny-write/g' "$TESTDATA"/sandbox_config_apparmor.json > "$TESTDIR"/apparmor3.json
    sed -e 's/%VALUE%/apparmor-test-deny-write/g' "$TESTDATA"/container_redis_apparmor.json > "$TESTDIR"/apparmor_container3.json

    run crictl runp "$TESTDIR"/apparmor3.json
    echo "$output"
    [ "$status" -eq 0 ]
    pod_id="$output"
    run crictl create "$pod_id" "$TESTDIR"/apparmor_container3.json "$TESTDIR"/apparmor3.json
    echo "$output"
    [ "$status" -eq 0 ]
    ctr_id="$output"
    run crictl exec --sync "$ctr_id" touch test.txt
    echo "$output"
    [[ "$output" =~ "Permission denied" ]]

    remove_apparmor_profile "$APPARMOR_TEST_PROFILE_PATH"
}

# 4. test running with wrong apparmor profile name.
# test that we can will fail when running a ctr with wrong apparmor profile name.
@test "run a container with wrong apparmor profile name" {
    # this test requires apparmor, so skip this test if apparmor is not enabled.
    enabled=$(is_apparmor_enabled)
    if [[ "$enabled" -eq 0 ]]; then
        skip "skip this test since apparmor is not enabled."
    fi
    if [[ "$CI" == "true" ]]; then
        skip "container tests don't support apparmor"
    fi

    start_crio

    sed -e 's/%VALUE%/not-exists/g' "$TESTDATA"/sandbox_config_apparmor.json > "$TESTDIR"/apparmor4.json
    sed -e 's/%VALUE%/not-exists/g' "$TESTDATA"/container_redis_apparmor.json > "$TESTDIR"/apparmor_container4.json

    run crictl runp "$TESTDIR"/apparmor4.json
    echo "$output"
    [ "$status" -eq 0 ]
    pod_id="$output"
    run crictl create "$pod_id" "$TESTDIR"/apparmor_container4.json "$TESTDIR"/apparmor4.json
    echo "$output"
    [ "$status" -ne 0 ]
    [[ "$output" =~ "Creating container failed" ]]
}

# 5. test running with default apparmor profile unloaded.
# test that we can will fail when running a ctr with wrong apparmor profile name.
@test "run a container after unloading default apparmor profile" {
    # this test requires apparmor, so skip this test if apparmor is not enabled.
    enabled=$(is_apparmor_enabled)
    if [[ "$enabled" -eq 0 ]]; then
        skip "skip this test since apparmor is not enabled."
    fi
    if [[ "$CI" == "true" ]]; then
        skip "container tests don't support apparmor"
    fi

    start_crio
    remove_apparmor_profile "$FAKE_CRIO_DEFAULT_PROFILE_PATH"

    sed -e 's/%VALUE%/runtime\/default/g' "$TESTDATA"/sandbox_config_apparmor.json > "$TESTDIR"/apparmor5.json
    sed -e 's/%VALUE%/runtime\/default/g' "$TESTDATA"/container_redis_apparmor.json > "$TESTDIR"/apparmor_container5.json

    run crictl runp "$TESTDIR"/apparmor5.json
    echo "$output"
    [ "$status" -eq 0 ]
    pod_id="$output"
    run crictl create "$pod_id" "$TESTDIR"/apparmor_container5.json "$TESTDIR"/apparmor5.json
    echo "$output"
    [ "$status" -ne 0 ]
}

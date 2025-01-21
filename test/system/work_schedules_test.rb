require "application_system_test_case"

class WorkSchedulesTest < ApplicationSystemTestCase
  setup do
    @work_schedule = work_schedules(:one)
  end

  test "visiting the index" do
    visit work_schedules_url
    assert_selector "h1", text: "Work schedules"
  end

  test "should create work schedule" do
    visit work_schedules_url
    click_on "New work schedule"

    fill_in "Day of week", with: @work_schedule.day_of_week
    fill_in "End time", with: @work_schedule.end_time
    fill_in "Start time", with: @work_schedule.start_time
    fill_in "Trainer", with: @work_schedule.trainer_id
    click_on "Create Work schedule"

    assert_text "Work schedule was successfully created"
    click_on "Back"
  end

  test "should update Work schedule" do
    visit work_schedule_url(@work_schedule)
    click_on "Edit this work schedule", match: :first

    fill_in "Day of week", with: @work_schedule.day_of_week
    fill_in "End time", with: @work_schedule.end_time.to_s
    fill_in "Start time", with: @work_schedule.start_time.to_s
    fill_in "Trainer", with: @work_schedule.trainer_id
    click_on "Update Work schedule"

    assert_text "Work schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Work schedule" do
    visit work_schedule_url(@work_schedule)
    click_on "Destroy this work schedule", match: :first

    assert_text "Work schedule was successfully destroyed"
  end
end

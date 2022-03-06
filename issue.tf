resource "highbond_issue" "issue-1" {
  project_id                 = 7395
  description                = "Issue Example"
  deficiency_type            = "Management Recommendation"
  identified_at              = "2019-02-03T17:02:33Z"
  title                      = "Issue created for testing"
  recommendation             = "No recommended action required as of now"
  severity                   = "Low"
  published                  = true
  reference                  = "123"
  risk                       = "Test Risk"
  scope                      = "Global"
  escalation                 = "Owner"
  cause                      = "Issue caused by testing"
  effect                     = "No Effect"
  cost_impact                = 524000
  executive_summary          = "Test Summary"
  executive_owner            = "Biswa Ranjan Behera"
  project_owner              = "Biswa Ranjan Behera"
  closed                     = true
  remediation_status         = "Closed"
  remediation_plan           = "Test Plan needed"
  remediation_date           = "2020-02-20"
  actual_remediation_date    = "2020-02-20"
  retest_deadline_date       = "2020-02-20"
  actual_retest_date         = "2020-02-20"
  retesting_results_overview = "Test description"
  position                   = 1
  owner                      = "Pooja Shetty"
  owner_user                 = "oDoV_zhoYHAEyeBXGSQs"  //Accepts UUID of the user

  target {
    id   = 7395
    type = "projects"  // "projects", "narratives", "objectives", "walkthrough_summaries", "project_plannings", "walkthroughs", "control_tests","control_test_plans", "project_results", "project_files", "risk_control_matrices", "testing_rounds", "risks", "controls"
  }
}
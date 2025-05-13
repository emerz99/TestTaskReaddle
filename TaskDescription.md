## Greetings %username% !

This is a quick manual on what we expect from you during performing the test task.

This will be a simple app that contains two features: Login & Checklist.

* First of all, get to know with the application under test, build the test app and check out its possibilities and bugs. 

* Second of all, we need to evaluate your qa manual background, so create down below:
 - short testplan 
 - list of the testcases
 - list of discovered issues
 
* Third of all, write test automation according test automation purposes  

* And fourth of all, push the whole project to github.com and notice us with a link to your repo on completion. 

Please reachout Oksana (otolstykh@readdle.com) if you have any questions.

## Good Luck!
* p.s. Do not tamper codebase of application

#YOUR TASK STARTS HERE: 


# TEST PLAN: 

1. Introduction

This test plan covers the approach for testing a mobile application with two features: Login and Checklist. The goal is to ensure these features function as expected, provide a smooth user experience, and maintain stability across different devices.

2. Scope

This test plan includes the following features:

- User authentication (Login)
- Checklist management (check details, complete task)

3. Test Objectives

- Validate the correct implementation of user login and authentication.
- Verify the creation, display, and management of checklist items.
- Ensure the app's UI elements are responsive and accessible.
- Identify and document any defects or inconsistencies.

4. Test Types
- Functional Testing: Validate core app features (login and checklist).
- UI Testing: Ensure UI elements are responsive, intuitive, and accessible.
- Regression Testing: Verify that new changes don’t negatively impact existing functionality.
- Negative Testing: Test edge cases, invalid inputs, and error handling.
- Test Automation: Automate repetitive tests to ensure faster execution and higher test coverage.

5. Test Environment
- IOS Emulators (iOS 18.4)

6. Test Scenarios
Added below

7. Test Data
- Valid and invalid login credentials
- Sample checklist items (e.g., “Buy milk”, “Sleep”)

8. Test Schedule

Testing will be conducted in the following phases:
- Test Planning
- Test Case Creation
- Test Execution
- Defect Logging and Retesting
- Regression Testing

9. Entry and Exit Criteria

- All required test environments are set up
- Test cases are prepared and reviewed
- All critical bugs are fixed before exit
- Test execution completed with 100% pass rate

10. Deliverables
- Test Cases
- Bug Reports
- Test Summary Report

11. Risks and Mitigations

- Potential network issues impacting login tests
- Inconsistent checklist data (Data persistence issues across sessions. Mitigation: Reset data between tests, verify correct storage methods.)




# LIST OF TEST CASES: 
// Only summaries of tests: e.g. 
- Perform login with correct login&password +
- Perform login with incorrect login +
- Verify all tasks are displayed in the task list
- Verify a single task can be marked as completed 
- Verify "Complete All" button marks all tasks as completed
- Verify 'Complete All' button is changed to 'Cancel All'
- Verify "Sort by Name" button sorts tasks alphabetically
- Verify list of subtasks are displayed when viewing task details (Verify that when the info button on the "Sleep" task is clicked, additional task details are displayed)
- Verify subtasks can be checked as completed
- Verify subtasks can be sorted
- Verify if subtasks are marked as completed if 'mark as completed' Sleep task on main screen
- Verify if uncheck 'completed' subtask (e.g. 'Close eyes') -> Main task is also uncheked (Precondition: Sleep task and all subtasks are checked)
- Verify logout from main screen
- Verify logout from 'Sleep' subtasks screen
- Cancel logout


# LIST OF DISCOVERED ISSUES:
// Only summaries of bug reports: e.g.
- Login can be performed with empty password field (not a real issue)

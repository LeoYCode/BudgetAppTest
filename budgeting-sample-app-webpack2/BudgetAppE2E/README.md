<h1>Budgeting Application</h1>

This is an example project demonstrating, the use of Ruby, Cucumber, Capybara, SitePrism.

<h2>Intro</h2>
The purpose of this repo is to demonstrate how Capybara and SitePrism using page object model, can provide an end to end solution for testing the application.
Test plan can be found in BudgetApp Directory called *Budgeting App Test Plan.pdf*

You will not need to worry about the relevant drivers, as this will be automatically downloaded


<h2>Usage</h2>
User will need to run:<br/>
```
bundle install
```
to retrieve all gems.

To run default set of tests on Chrome browser:<br/>
```
cucumber
```

To run on Chrome/Firefox/Iphone/Headless browser, replace iphone value below with which you require:<br/>

```
cucumber BROWSER=iphone
```

To run @mobile tagged tests:<br/>
```
cucumber -p mobile BROWSER=iphone
```

Reports are generated after each test run here:<br/>

```
features/reports
```
Cucumber HTML report can be opened in any browser, failed test screenshots are located:</br>
```
features/reports/screenshots
```

<h2>Tested</h2>
Framework was tested on 19th May 2020:



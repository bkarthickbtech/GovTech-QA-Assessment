# Introduction

Airwallex API automation by using robot framework
   
# Requirements <br>
Python 3 <br>
Virutialenv 16.0.0 <br>
pip 18.1 <br>
ChromeDriver <br>


# Installation
  Install Python, PIP, VirtualEnv

	python --version  - 3
	Note: In Mac OS you have Python pre installed.


# Install pip

  $ easy_install pip
or if you get an error
  $ sudo easy_install pip

 Once installed you see, 

# Install virtualenv:

Virtualenv is a tool used to create an isolated Python environment. This environment has its own installation directories that doesn't share libraries with other virtualenv environments (and optionally doesn't access the globally installed libraries either).

Virtualenv is the easiest and recommended way to configure a custom Python environment.

# Install virtualenv:

	$ sudo -H pip install virtualenv 
Once installed you see, 


Navigate to where you want to store your code. Create a new directory.
      
    	$ sudo mkdir my_project && cd my_project

Inside project folder create a new virtualenv

	$ virtualenv env

Activate virtualenv environment:

	$ source env/bin/activate

Import Python path:

	$ export PYTHONPATH=library/.


# Create Requirements Text file

Create the requirements.txt file in the project folder
	
robotframework<br>
robotframework-requests<br>
robotframework-seleniumlibrary<br>
robotframework-jsonlibrary<br>
robotframework-httplibrary<br>


# Install Package<br>

Install necessary packages

    $ pip install -r requirements.txt


# Steps to run the code:

    Trigger robot to run test suite
        
       robot   suites/

# Below Test Scenarios being covered in this Project
    
  ClerksActions.robot

    Feature: Addition of working class hero by Clerk
          Scenario: TC-001 Addition of Single Working class hero
          Scenario: TC-002 Verify natid Existing records in the Database
          Scenario: TC-003 Addition of working class hero using csv file from UI
  
  GovernorActions.robot

    Feature: Verify Governor actions on UI
           Scenario: TC-004 Verify Governor actions on UI
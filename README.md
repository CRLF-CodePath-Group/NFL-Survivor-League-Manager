# Group Project - NFL Survivor League Manager

**NFL Survivor League Manager** an app geared towards managing NFL Survivor Leagues.

The rules of NFL Survivor are:
1. Each player must pick ONE team each week to win. If that team wins, then the player stays in, or else they are knocked out.
2. Once a player has picked a team for that league, they are no longer allowed to pick that team again.
3. Last man standing wins.

This app is geared toward making the managing of the league more hassle free. 

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is completed:
- [X] New users can create an account or existing users can return and log back in.
- [X] User is brought to main hub that they can see: leagues they are in, leagues they manage, and a button to create a new league
- [X] Users can create their own league
- [X] Users can invite others to join their league
- [X] Users can view details of leagues they are in, and select their picks for the week(but cannot see others picks)
- [X] Managers screen can make their pick and view status of other users (alive/dead)
- [X] Set up NFL API to automatically get NFL schedule and W/L for each week.

The following **stretch** features are implemented:
- [ ] Retractable side bar menu with all options and settings available
- [ ] Turn hub into a notification screen for information going on in leagues
- [ ] Move leagues managed and particpating in to two seperate stories, accessed by retractable side bar menu
- [ ] Group chat for individual leagues
- [ ] User profile with avatar and stats on their particpation in leagues


## Tables
There will be two tables stored in the database, one being for users and the other being leagues.

Users consists of:
Screenname, string
Email, string
password
list of league ids, int

Leagues consists of:
leaguename, string
owner, string
currentWeek, int
list of alive users, user
list of eliminated users, user
an array of lists, each array spot representing an NFL week, and each list containing picks. A pick is a pair of username and a team name


## APIs
This project will use the Parse pod hosted on Heroku for database storage.
This project also gathers NFL data provided by [MySportsFeeds](https://www.mysportsfeeds.com/data-feeds/api-docs/)



## Video Walkthrough

Here's a walkthrough of implemented user stories:

**Log In and Sign Up**

![](https://github.com/CRLF-CodePath-Group/NFL-Survior-League-Manager/blob/master/Demos/nflSurviviorLogInSIgnUpDemo.gif)


**Creation of league and inviting users**

![](https://github.com/CRLF-CodePath-Group/NFL-Survior-League-Manager/blob/master/Demos/nflSurvivorLeagueCreateAndInviteDemo.gif)


**Inviting, Picking and managing league**

![](https://github.com/CRLF-CodePath-Group/NFL-Survior-League-Manager/blob/master/Demos/nflSurvivorLeaguePickingDemo.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [2018] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

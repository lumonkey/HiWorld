# HiWorld
social app that is using geolocation, help you to add other users near you


## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Uses users’ geolocation (under permission) find other users who’s open to conversations with strangers. Could be potentially used as a dating app, or just meeting new friends nearby.

### App Evaluation
- **Category:** Social Networking / Social Communication 
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on an iPad, such as WeChat (only allows users to login if they agreed to login with other devices simultaneously) or other similar apps. Functionality wouldn't be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Locates users’ coordinates and show them other users who’s open to strangers to “sayHi”. The user can then decide to message this person with our “sayHi” button and start up conversations if this person respond with “sayHi” button or even befriend them if wanted.
- **Market:** Any individual could choose to use this app, and to keep it a safe environment, friend would be organized into alphabetical order.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how deep their social life is, and what exactly they're looking for.
- **Scope:** First user would choose the person he or she wants to start the conversation with based on geolocation, then perhaps this could evolve into a social networking application as well to broaden its usage if that person would like to connect with this user. Large potential for use with Apple map API, Google map API, or other map API.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in to access previous chats and preference settings.
* User chose the way how app access the location(always allow, only while using the app, or never).
* Friends have a chat window to get to know each other, with the ability to block and delete (WeChat Style).
* Profile pages for each user.
* “sayHi” button in order to start up the conversation with other user (cannot start up the freely conversation with other user till that person respond to the message with “Hi”).
* Settings (Accesibility, Notification, General, etc.)

**Optional Nice-to-have Stories**

* Posts for user to share their day with friends(friends only).
* Profile Add-On: personal interests , recent post(users agreed to be seen by strangers) etc.

### 2. Screen Archetypes

* Login 
* Register - User signs up or logs into their account
   * Upon Reopening of the application, the user is not required to log in again as long as the user did not log out the account in the last session.
* Messaging Screen - Chat for users to communicate (direct 1-on-1)
   * Upon selecting users in the “Friends” section and message screen opens (freely conversation with friends)
   * Upon pressing the button “sayHi” to users nearby and message screen opens (only can start the conversation after other user respond)
* Profile Screen 
   * Allows user to upload a photo and fill in information about their personal interests and posts for strangers to see
* World Screen.
   * Allows user to be able to choose other users nearby and start up the conversation with the ones that user wants to.
* Settings Screen
   * Lets people change language, and app notification settings.
* Discover Screen(optional but nice-to-have)
   * Lets people upload pictures or write down their thoughts or share feelings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* “sayHi” button
* Profile
* Settings
* Friends
* World

Optional:
* Posts
* Discover 

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* World -> Users available to talk with -> “sayHi” button required to be selected(limited once) ->Other user respond ->Chat screen keyboard accessible-> Add friend available
* Profile -> Text field to be modified. 
* Settings -> Toggle settings

## Wireframes
<img src="http://g.recordit.co/xOlsmQyqBc.gif" width=800><br>

### Build progress
<img src="http://g.recordit.co/2ITb6foLGm.gif" width=200>

### Build progress - plan change
* Since always use users' geolocation not only uses huge amout of callular data but also may harm users' privacy (even though only shows to strangers with in a certain distance of range. )So we decided to change a little bit of our map feature. And the changes are as follows:
  * 1.Only use users' geolocation while they're use the app and using the 'World' feature (so others can see each other while they both are looking for strangers to say 'Hi');
  * 2.We will keep the range and display users' geolocation within 200 meters range (about your eyesight range, this is safe enough because if you're outside on the street it will be the same thing, someone else is able to see you so this does not encounter privacy issue especially this is totally under users' permissions);
  * 3.Furthermore, we won't update the locations as frequent as planned (update every 30 seconds) based on two reasons:
    i)currently we're using Heroku as the cloud platform, it does not have the ability to update so frequently
    ii)provide more protection over our user to prevent them being tailed by strangers

## User Stories

The following functionality is completed:

- [x] User can log out. 
- [x] User can sign up with their existed email address. 
- [x] User stays logged in across restarts. 
- [x] User can log out. 
- [x] User can view their personal info. 
- [x] User can see their current geolocation with 'World' feature. 
- [x] User can change their profile pic and name
- [x] User can add a profile picture.
- [x] User get alerted if there is an error.

The following features are going to be implemented this week:

- [ ] Profile pictures are shown for posts and comments. 
- [ ] User can press on the 'sayHi' button and it goes to another viewcontroller.
- [ ] Users' geolocations get to upload to cloud(Heroku).
- [ ] User can view the nearby users on the map with pinpoints.

### [BONUS] Digital Wireframes & Mockups
<img src="https://i.imgur.com/lYHn37F.jpg" height=200>

### [BONUS] Interactive Prototype
<img src="https://i.imgur.com/AiKfE5g.gif" width=200>

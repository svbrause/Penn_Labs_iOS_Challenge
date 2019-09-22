# Penn_Labs_iOS_Challenge

In designing this app, I implemented each detail with ideas in mind about how to create an optimal finished product. Below are descriptions of different aspects of my design process along with reasons for making the decisions I made.

## File Layout

I created this app using 5 main Swift files:
* ViewController.swift contains the main class HomeViewController that controls the home page of the app
* ViewController + UI.swift contains an extension of HomeViewController that contains long functions like loading images and text from the JSON into the UI elements
* DiningStructures.swift contains the Decodable data structures used to contain the JSON data
* JSONDecode contains a function to read in the JSON input and read it into a DiningDocument structure for use elsewhere in the program
* WebViewController.swift contains functions that allow for interaction with the web view

This structure allows for the different features of the app to be developed in different files so that problems can be more easily isolated and the code is easier to work with and understand.

## Storyboard Design

I decided to use a storyboard to design my app because that is what I am most familiar with. In my storyboard, I used a TableViewController as the main screen on my app because I liked how it allowed for automatic scrolling and laid out the different dining options nicely and similarly to how they are laid out in the Zeplin design. Each cell in the TableViewController has either a section label for the "Dining Halls" and "Retail Dining" sections or a specific dining option. Each dining option has a permanent cell because the dining options offered on campus don't often change. Most of the design elements simply followed the Zeplin format, as that was suggested in the assignment.

## Functionality

For the app, I implemented as many of the requirements as I was able to in the timeframe that I worked on this project. With this in mind, I implemented all of the required functionality in parts I, II, and III of the assignment with the exceptions of the "OPEN" and "CLOSED" labels for each dining option. I then implemented the progress view of Part IV for my web browser.

## Implementation

To implement my app, I used the viewDidLoad method in HomeViewController to call methods to pull information from the JSON file and use that information to set the UI elements accordingly. I then used IBActions for the button in each table view cell to trigger segues to the WebViewController and a NavigationController to allow for navigation from the web screen back to the home screen. While developing this app, I tested each new feature I implemented to ensure that it worked properly before moving to the next screen.

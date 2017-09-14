# Cleverbean

### Install
Download the repo and then in the projects root dir run (via terminal):
* pod install

Feel free to run in XCode (I'm using 8.3.3)

-----------------------------------------------


#### What is this repo ?

Just prior to meeting with you all, I had wanted to do a real comparison of 'speed of development' (plus - dev experience/flow/tooling) between Swift and React Native, on an actual production project. My feeling is that the result will be surprising (vs. common perceptions) and there's much I can discuss about it, however we can do that at another time(!).

Just as a reminder, this Swift project is only a few days old and has plenty left to do.

However hopefully what is here so far will give you a feel for how I structure and reason about code. 

Some quick points I'd like to make in that context:
* "survey" the project at a high level and identify as much shared/common components as possible/practical
	* make use of platform features such as extension methods (eg. on UIKit elements), appearance() API's etc. 
	* obviously there's Frameworks, Cocoapods/Carthage too etc.
* logical separation of storyboards via references
* leverage XCode UI features such as @IBDesignable/@IBInspectible
* separation of data and services components
	* you'll see here that I've used the singleton pattern for the Firebase API and I'm aware of the debate over this (even though Apple use it everywhere) and there's other alternatives such as dependency injection etc. I may potentially refactor this later.
* unit tests / UI tests - they're not in this project yet and I'm also aware that the addition of such tests can be driven by the cost of a project (eg. Alphabucks app MVP did not use them given time and cost constraints from 2DayFM's perspective)

These are just a few points and not 'all'. Again just to help you see how I like to go about things.



Lastly, with all this in mind, I'm aware that you currently like to make use of MVVM and reactive development patterns in your iOS projects. As we talked about during the meeting I'm a big fan of reactive development (eg. React Native, Rx*) and so adopting this in Sentia's iOS projects is, well, kind of awesome! 









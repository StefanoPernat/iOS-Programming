# The Big Nerd Ranch iOS Programming 6th Edition

This is the repository I will use to learn iOS programming, it will be divided into branches for every chapter.

## A simple iOS application: Quiz

In this simple project I learned the basic structure of an iOS application, learned also a litte bit of AutoLayout.  
I have changed also the default app icon, and generated a launchscreen from main storyboard.

## The Swift Language

Experienced the basics of the Swift language, like *Variables and Constants*, *Type Annotation*,  
**Collection Types**, **Initializers**, **Properties**, **Instance methods**, **Optionals**, **Loops**, **Enumeration**. 

## Views and the View Hierarchy

Learned about Autolayout, through Interface Builder I learned how to use Autolayout for making the layout consistent on multiple resolution and screen sizes.  
I also practiced creating views programmatically, in this way I learned about iOS views hierarchy.

> **Bronze Challenge**: Remove all the constraints from **View Conroller** interface and then add them back in. Try to do this without consulting the book.

## Text Input and Delegation

WorldTrotter tought me about UITextField properties, property observers, computed properties and closures.  
I learned also to use in a very simple way the UIGestureRecognizer, last but not least I learned about delegates.  

> **Bronze Challenge**: the user can enter alphabetic characters either by using a bluetooth keyboard or by pasting copied text into the text field. Fix the issue

> *Hint*: use NSCharacterSet class

## View Controllers

In this chapter I learned to add a new ViewController to the storyboard, I also experienced a new type of ViewController (UITabBarController) that manages via an array multiple controllers at once, and it has also a TabBar with titles and images for every ViewControllers.  
I also learned a little bit more about the view controller lifecycle methods and graphics.

> **Silver Challenge**: Whenever the ConversionViewController is viewed update its background color based on the time of day.  
In the evening the background should be a dark color, otherwise the background should be a light color.  (override viewWillAppear to accomplish this)

## Programmatic Views

In this chapter I learned to create some views programmatically, I was also able to define some constraints in code (using anchors and margins).  
I used a UISegmentedControl for the first time, and defined an action programmatically with the addTarget method.

> **Bronze Challenge**: create a new view controller and add it to the TabBarViewController, this ViewController should display a VKWebView (class used to display web content). The WebView should display [www.bignerdranch.com](http://www.bignerdranch.com).

> **Silver Challenge**: Add a button to the MapViewController that displays and zooms in to the user current location (you need to use delegation *VKWebViewDelegate*)

> **Gold Challenge**: MapView can display pins, which are instances of MKPinAnnotationView, add those pins to the map view: one **where you where born**, one **where you are now**, one at an interesting location you have visited in the past. Then add a button to the interface that allows the map to display the location of a pin. Subsequent taps shoud simply cycle through the list of pins. 

## Localization

In this chapter I learned how to localize an app in another languages via localizable.strings and NSLocalizedStrings

> **Bronze Challenge**: Localize WorldTrotter for another language

## Controlling Animations

In this chapter I learned a bit of animation and how to animate views using the UIView.animate method

## Debugging

In this chapter I practiced using the debugger and some LLDB commands

## UITableView and UITableViewController

In this chapter I learned to use UITableView and UITableView controller, I learned also to save memory reusing cells instead of creating new cell every time,
the challenges helped me to practice with the UITableViewDataSource protocol and its methods

## Editing UITableView

In this chapter I learned to use the tableview delegates methods to delete and move rows, I also used a UIAlertController to inform the user of the deletion

> **Bronze Challenge**: Rename the delete confirmation button to remove

> 

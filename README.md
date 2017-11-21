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

> **Silver Challenge**: Make it so the tableview always shows a final row that says "No more items", and make it so that the final row cannot be moved

> **Gold Challenge**: Make it so that no matter what the no more items row can never be knocked out of the last position and make it undeletable

## Subclassing UITableViewCell

In this chapter I learned how to use custom UITableViewCells and made custom classes for that, I also learned a bit of dinamic types"

> **Bronze Challenge**: Update the ItemCell to display the value in dollars in green if the value is less than 50 and red otherwise

## Using UIStackViews

In this chapter I learned how to use stackviews to made much more consistent views, with less constraint, I learned also to lauch a new ViewController using the segue mechanism

## UINavigation Controller

In this chapter I learned about using the NavigationViewController, UIBarButtonItem and also a litte bit of UITapGestureRecognizer

> Change from QWERTY keyboard to Number Pad of DetailViewController

> Subclass UITextField class and override resign and become first responder so that its border will change

> Added button for changing date and pushed a ChangeDateViewController to do so

## Camera

In this chapter I learned how to use iPhone camera, and UIImagePicker. I implemented some of the UIImagePickerDelegate callback methods.

> **Bronze Challenge**: enable editing on UIImagePicker

> **Silver Challenge**: added a button for clearing an image

> **Gold Challenge**: set the Camera overlay view

## Saving, Loading, and Application States

In this chapter I learned about NSCoding protocol and how to implement its methods for archiving purposes, (like java serialization)
I learned also a little bit of Application sandbox, I constructed successfully an url that points to the Documents directory of the application sandbox for saving items on the filesystem

I learned also about application state transitions.

> **Bronze Challenge**: Instead of saving each item image as JPEG, save it as PNG

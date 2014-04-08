# Overview
This repo contains a demo project that I wrote for a presentation on RestKit that I gave to the Advanced iOS Meetup Group.  It takes a simple project that uses some hardcoded data to present views and, over a few iterations, changes the project to use RestKit to communicate with a demo server that should also be available in the same Github repo.

The presentation uses a slide deck posted on SpeakerDeck.  I'll upload the deck right before or after the talk.

# Setup
The source should be nearly ready to run as-is, but there are a few steps that you should take, after you clone the repo, but before you run the project.

1. Make sure that you have cocoapods installed.
2. Run `pod install` at the level of the Podfile.
3. Deploy a the restkit-demo-server somewhere where the app can access it (localhost is fine).
4. Add some data to your server.
4. Change the base url that RestKit is using (in the later tags) to match wherever your server is deployed.

# Tags
Below are some of the tags that I'm going to be jumping to during the presentation.  I've given a brief description at each tag, but the easiest way to follow along is to look at the diffs, since Objective-C can be a little verbose.

# demo1
This is the place where I'm going to start the talk.  I've got a simple app that is eventually going to fetch a list of beers from a server and then display them in a way that matches the mockups that my fake designer has given to me.  You should note here that I've started with a basic data model (RKBeer) and I'm leveraging that object to create some fake data that the client can display.  Most of the code that you're going to be interested in is located in the RKBeerTableViewController.m file.  We're not hitting any external data source yet, but we will be soon.

# demo2
At this point, I've added a RestKit request operation that will theoretically query a server that I've deployed.  If you want to try to actually run this against a server, you'll need to update the base url of the request and deploy your own server.  The changes from the demo1 tag are going to be entirely in the RKBeerTableViewController.m file, so you should be looking there.  As a little bit of a spoiler, the code at this tag is not going to actually fetch data from the server, because the response mappings have not been configured correctly.  It's a good start, but we'll do better with the next tag.

# demo3
With this tag I've created an intermediate response mapping that will allow us to finally get some data.  If you run this code against a matching server, you'll see that you now have a parsed RKBeerListResponse that you can deal with.  When you look at this tag, you should make sure that you understand the structure of the RKBeerListResponse model and you should look at how the mapping in RKBeerTableViewController.m has changed from the previous tag.  Unfortunately, this tag puts us a little short of where we'd like to be, because the beers array on the response is just a set of objects, not the actual RKBeer object that we want to deal with.  We could do some type coercion here to make this work for us, but we'll do better in the next tag.

# demo4
In this tag, I've fixed the previous mapping mistake so that our response now contains RKBeer objects, instead of just plain NSObjects.  It's important to look at the mapping in RKBeerTableViewController.m again and to make sure you understand why we need to define the beer model separately.  Since we now have the objects that we started looking for, we're happy, but we'll have less fun when we want to add another server call to the same viewcontroller.  If we keep going the way we're moving now, we're going to have a bunch of hard-coded strings all over our viewcontrollers that configure our server endpoints.  In the next tag, we'll move all of our RestKit configuration into the AppDelegate so that we only have to configure that once, and it's all in the same place.

# demo5
This tag is basically at the same point as the previous tag, except that the RestKit configuration has been moved into the AppDelegate.  This allows us to keep our configuration nice and neat, and to share an RKObjectManager that will make our server calls a bit nicer.  We're able to share headers and a base url with these changes, so make sure that you look at how I've configured the RKObjectManager inside PLAppDelegate.m.  Now that we'll pretty happy with RestKit, we're going to want to use RestKit in other ways, so in the next tag, we'll set up our app to create new objects on the server.

# demo6
At this point, we are very happy with RestKit.  There is a lot to understand in this change, because it repeats many of the elements I've already covered, in a slightly different way.  Now, instead of a GET request that has to map a bunch of JSON into our RKBeer models, we need to send the server a message that it will be able to understand as a request to add a new beer to the database.  There is a bit of a gap in this tag, because you have to know what the server wants to receive as a POST.  You should be able to look at my RKAddBeerRequest.h and my RKBeerForm.h objects to get a good idea of the format that the server needs.  The mapping that you'll want to look at is now in PLAppDelegate.m and it's used in our favorite RKBeerTableViewController.m.  One last thing that we can do to make our RestKit experience a little bit nicer is to apply the pattern that we'll check out in the next tag.

# demo7
In this tag, I've moved our requests into their own RKBeerClient.m so that the RKBeerTableViewController.m no longer has to know about the implementation details of how the requests are made.  Instead, our viewcontrollers can now implement the delegate methods of our APIClients, and only act when the information that they care about is ready.  Now, we've made our requests, we're parsing our responses, and we've encapsulated all of our network logic, so we're going to end here.

# Questions?
Thanks for following along the whole way, I hope this was helpful for you.  If you've still got questions at this point, you can email me at ace@palominolabs.com and I'll hopefully be able to help you out.

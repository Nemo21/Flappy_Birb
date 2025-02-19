## Lesson 0:

- How this game works:
    - Bird in the middle of the screen
    - Bird on click or spacebar will jump
    - GOAL: Prevent the bird from touching either the pipes or ground
    - Everytime bird makes it past a pair of pipes,player scores a point
    - As soon as you touch a pipe or hit the ground,GAME OVER
    
- To load images from a graphics file(jpeg,png) from disk
- We use love.graphics.newImage(path)
- This stores it in an object we can draw on the screen
- Define actual and virtual resolution to render our game using push library
- Load the game with love.load which is called at the start of the program execution
- Dont want image to be blurry and upscalled (use nearest neighbour filtering)
- Set title and get the quit working
- Get resize working by using push's function to resize

## Lesson 1:
- We will now implement having a parallax effect
- What is parallax effect ?
    - You’re looking out the window of a car or bus while it’s moving. What happens?
        - The things closest to the window (like a fence or a tree) zoom past super fast.
        - The things further back (like houses or hills) move more slowly.
        - The faraway stuff (like mountains or the sky) barely moves at all.
    - This movement creates a sense of depth even though everything is flat.
    
- We will keep track of horizonal scroll position 
- We will also have a speed of backgrounds to control how fast each layer scrolls
- The ground will scroll faster to create a parallax effect
- % very important to sort of "loop" it back to 0 , creating continous scrolling 
- looping point will be the width of the image to make sure after the % it reaches back to the starting of the image 
- Make this frame rate independent too to have consistent scrolling speed 
- Offset will the position shit which will have a left to right scrolling effect instead of moving the image block by block
- TODO:Reiterate on it again 
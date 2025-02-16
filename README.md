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
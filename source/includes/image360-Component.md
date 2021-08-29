## Basics

find the source here [threesixty](https://www.npmjs.com/package/@mladenilic/threesixty.js)

Start rotation: `threesixty.play();`

Rotate in oposite direction: `threesixty.play(true);`

Stop rotation: `threesixty.stop();`

Play/Stop rotation: `threesixty.toggle();`

API: from

```javascript
{

 Source image url // Also supports passing an array of images
 image: 'images/example.jpg',

 //* Sprite options (If array of images are provided, these options are ignored)
 count: 30,                   // Total number of images. Default: 0
 perRow: 5,                   // Number of images per row. Default: 0

Width & Height
 width: 300,  // Image width. Default 300
 height: 300, // Image height. Default 300

Navigation
 prev: document.getElementById('prev'), // Previous button element. Default: null
 next: document.getElementById('next'), // Next button element. Default: null
 keys: true,         // Rotate image on arrow keys. Default: true
 draggable: true,    // Rotate image by dragging. Default: true
 swipeable: true,    // Rotate image by swiping on mobile screens. Default: true
 dragTolerance: 10,  // Rotation speed when dragging. Default: 10
 swipeTolerance: 10, // Rotation speed when swiping. Default: 10
 swipeTarget: document.getElementById('wrapper'), // Element which will listen for drag/swipe events. Default: Image container

 //* Rotation settings
 speed: 100,     // Rotation speed during 'play' mode. Default: 10
 inverted: false // Inverts rotation direction
}
```

### style.css

```css
#threesixty {
  margin: 0 auto;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.g-hub {
  color: #444;
  font-size: 0.9em;
}

.button {
  position: relative;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: none;
  padding: 40px 7px 5px;
  cursor: pointer;
}
.button::before,
.button::after {
  content: '';
  position: absolute;
  top: 10px;
  left: 50%;
  border-left: 3px solid #000;
  border-top: 3px solid #000;
  width: 20px;
  height: 20px;
  -webkit-transform: translate(-45%) rotate(-45deg);
  transform: translate(-45%) rotate(-45deg);
}
.button::after {
  -webkit-transform: translate(5%) rotate(-45deg);
  transform: translate(5%) rotate(-45deg);
}

#next::before {
  -webkit-transform: translate(-90%) rotate(135deg);
  transform: translate(-90%) rotate(135deg);
}
#next::after {
  -webkit-transform: translate(-50%) rotate(135deg);
  transform: translate(-50%) rotate(135deg);
}
```

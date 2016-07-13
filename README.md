# UIView Custom Property Animation
Companion repo for a blog post about animating custom UIView properties. Check out the full blog post here: https://blog.codecentric.de/en/2016/07/custom-property-uiview-block-animation

Animate a custom property inside an UIView animation block with easing, springs and other options.

```
[UIView animateWithDuration:0.5
                 animations:^{
                     self.clock.hourHand = 9.0;
                     self.clock.minutehand = 41.0;
                 }];
```

```
UIView.animateWithDuration(0.5) {
    self.animView?.hourHand = 9.0
    self.animView?.minuteHand = 41.0
}
```

There is a known issue explained in the blog post. If you find a way to solve it please submit a pull request or contact me at [@nlajic](https://twitter.com/nlajic).

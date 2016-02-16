# EndlessScrollview
Creates a sneaky implementation of CCLayoutBox which acts as an infinitely-scrolling content node for cocos2D's CCScrollView.

Just add your sprites to the `init` method of the `ContentNode` class.

Next steps would be to modify CCScrollView to not update its `horizontalPage` property until after its scrolling animation is finished; that would prevent the 'snapping' effect that appears now when scrolling imprecisely.

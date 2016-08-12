# ANCustomButton
ButtonWithArrangedImageAndTitle (both web image and assets are supported).

## Usage
(you can also see sample Xcode project in `/ANCustomButton_Demo`)
* Add folder `ANCustomButton_Demo/ANCustomButton` to your project.
* `#import “ANCustomButton.h”` to your view controller.
* Create custom button method:
```
    // choose a type of ANButtonType
    ANCustomButton *button = [ANCustomButton buttonWithType:ANButtonTypeImageTopTitleBottom andImageString:@"picture" andTitle:@"ButtonName" andFontSize:12];
    
    // set other properties
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"arrow_more_selected"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    ...
    
    // use either frame or constraint
    button.frame = CGRectMake(200, 50, 120, 60);
```
* Add created button to the view.
* If you don't use `translatesAutoresizingMaskIntoConstraints`, then you should set button constraints.

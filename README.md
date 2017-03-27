# ANCustomButton
Button With Arranged Image And Title (both web image and assets are supported).

## Usage
(you can also see sample Xcode project in `/ANCustomButton_Demo`)
* Add folder `ANCustomButton_Demo/ANCustomButton` to your project.
* `#import “UIButton+CustomLayout.h”` to your view controller.
* Create custom button method:
```
    // choose a type of ANButtonType
    UIButton *button1 = [UIButton buttonWithType:ANButtonTypeImageTopTitleBottom
                                          margin:10
                                       titleFont:[UIFont systemFontOfSize:16.0]
                                     normalTitle:@"title111111"
                                     normalImage:[UIImage imageNamed:@"best"]];
    
    // set other properties
    [button1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button1 addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    ...
    
    // set button's "buttonFrameOrigin"
    button1.buttonFrameOrigin = CGPointMake(20, 40);
    
    // add button to your view
    [self.view addSubview:button1];
    
    // if you use "ANButtonTypeCustomRect", then you should set "imageRect" and "titleRect" like this
    UIButton *button5 = [UIButton buttonWithType:ANButtonTypeCustomRect
                                          margin:0
                                       titleFont:[UIFont systemFontOfSize:20.0]
                                     normalTitle:@"custom"
                                     normalImage:[UIImage imageNamed:@"best"]];
    [button5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button5.imageRect = CGRectMake(0, 0, 100, 60);
    button5.titleRect = CGRectMake(18, 40, 82, 20);
    button5.frame = CGRectMake(150, 40, 100, 60);
    [self.view addSubview:button5];
    
```
* If you don't use `translatesAutoresizingMaskIntoConstraints`, then you should set button constraints.



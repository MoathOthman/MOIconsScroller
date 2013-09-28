MOIconsScroller
===============
--------------------------------

icons style View Which meant to look like the icons on springboard or simply grid View, made to be **simple** to use with the basic functionalities (**add and remove**) .



#Structure

---------------------

MOIconsScroller from its name is represented by several iCons inside a UIScrollView, each icon is a node and all nodes are represented by a double-linked list .


#features

--------------------

There are three main **Features** of the MOIconsScroller

* Delete an Icon
* Add A new Icon
* dynamic number of icons per row


#How To Use

------------------------------------

In order to use ***MOIconsScroller*** you need to setup some delegates and DataSource first . no need for special frameworks to add not even quartzQore. 

###Pre-Initialize 

* Drag the MoIconsScroller files into your project 
*  import it  -> `#import "MOIconsScroller.h"`
* Call the protocols 
` <MOIconsScrollerDataSource,MOIconsScrollerDelegate>
`

###Initialize

- Add a **UiScollView** To your **IB** and change its class to **MOIconsScroller** .
-  Create an IBoutLet for it and name it e.g. *iconScroller*.
- Set *delegate* and *datasource* 
>   -  _iconScroller.dataSource=self;
>    _iconScroller.iconDelegate=self;
    
    
    

      
*  Add a delete Observer (important)
>       [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(iconTappedNotificationRecieved:) name:iconDeletedNotification object:nil];



* implement the *iconTappedNotificationRecieved*
   in this way 
     
>  -(void)iconTappedNotificationRecieved:(NSNotification*)notification{


   
> > >  if ([[notification name]isEqualToString:iconDeletedNotification]) {
  
> > > `  [_iconScroller performSelector:@selector(removeIconAtIndex:) withObject: [notification object]  afterDelay:0];
> `  
>     }
    
    
> }  

>    * you may change the delay the way you want ..




- Now implement the data Source and Delegates !

  e.g.
  
  
  
   `
 
 `-(NSInteger)numberOfIcons{
 
    return imagesList.count;
    
}`
`-(NSInteger)MaxumberOfIconsInEachRow{

    return 1;
    
}`

-(FolderIconView *)viewForIconAtIndex:(int)index{
    
    FolderIconView *_iconView=[[FolderIconView alloc]initWithFrame:CGRectMake(15, 0, 90, 90)];
    _iconView.tag   =index;
    
    _iconView.titleLAbel.text=imagesList[index];
    
    _iconView.iconImageView.image= [UIImage imageNamed:imagesList[index]];
    
    return _iconView;
}

`-(void)iconView:(IconView *)iconView didTappedAtIndex:(NSInteger)index{

     <#Some Code#>
    
}`
`

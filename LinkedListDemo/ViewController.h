//
//  ViewController.h
//  LinkedListDemo
//
//  Created by mac-mini2 on 16/10/11.
//  Copyright © 2016年 jason‘s cube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 * 结构体的三种定义方式
 *
 * 1、先类型，后变量
 * 2、类型、变量同时
 * 3、直接定义变量【该定义方法由于无法记录该结构体类型，所以除直接定义外，不能再定义该结构体类型变量。】
 */

/**
 * 访问结构体内部变量的两种方式
 *
 * 1、pNode.val,变量名.成员变量名
 * 2、struct Node *aNode; aNode->val，指向结构体的指针->成员变量名
 */

//定义链表的节点
typedef struct Node {//Node是类型
    int val;                  //数据域
    struct Node *next;        //指针域
}pNode;//pNode是变量名

@interface ViewController : UIViewController

//test
- (struct Node*)createHead;
- (void)pushFrontWithNode:(struct Node *)head Val:(const int)val;
- (void)pushBackWithNode:(struct Node *)head Val:(const int)val;
- (void)removeNode:(struct Node *)head ByVal:(const int)val;
- (void)removeAllWithNode:(struct Node *)head;
- (void)printWithNode:(struct Node *)head;
- (void)changeNode:(struct Node *)head WithChangeVal:(int)changeVal ByVal:(const int)val;
- (struct Node *)reverseWithNode:(struct Node *)head;

@end


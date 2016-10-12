//
//  ViewController.m
//  LinkedListDemo
//
//  Created by mac-mini2 on 16/10/11.
//  Copyright © 2016年 jason‘s cube. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    struct Node *headNode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    headNode = [self createHead];
//    NSAssert(headNode, @"head node create failure");
//    NSLog(@"headVal：%d",headNode->val);
}

//creat a list
- (struct Node*)createHead{

    //head是指向结构体的指针
    struct Node *head = (struct Node *)malloc(sizeof(struct Node *));

    head->next = NULL; //防止野指针
    head->val = 0;
    return head;
}

//头插法，时间复杂度O(1)
- (void)pushFrontWithNode:(struct Node *)head Val:(const int)val{

    if (!head){

        NSLog(@"链表不存在");
        return ;  //判断链表是否存在，通过头指针是否为空
    }
    struct Node *nNode = (struct Node *)malloc(sizeof(struct Node *));//获取内存空间
//    struct Node *nNode;//错误的方式

    nNode->val = val;//数据域赋值

    //新的节点插入到原节点的后一位
    nNode->next = head->next;//新节点的指针域 == 头节点的指针域
    head->next = nNode;//头节点的指针域 == 指向新节点的指针

    ++head->val;//统计节点个数
}

//尾插法，时间复杂度O(n)
- (void)pushBackWithNode:(struct Node *)head Val:(const int)val{

    if (!head){

        NSLog(@"链表不存在");
        return ;  //判断链表是否存在，通过头指针是否为空
    }
    struct Node *nNode = (struct Node *)malloc(sizeof(struct Node *));//获取内存空间

    nNode->val = val;//数据域赋值

    //新的节点插入到链表的最后面
    struct Node *pNode = head;//中间指针 == 指向原节点的指针
    //用遍历的方式，得到指向最后最后一个节点的指针
    while (pNode->next) {//如果原节点的指针域 != NULL
        pNode = pNode->next; //则中间指针 == 原节点的指针域
    }
    pNode->next = nNode;
    nNode->next = NULL;

    ++head->val;//统计节点个数
}

//删除链表中第一个值为val的节点
- (void)removeNode:(struct Node *)head ByVal:(const int)val{

    if (!head || !head->next){

        NSLog(@"链表不存在或只有头节点");
        return ;
    }
    //遍历链表
    struct Node *pNode = head;
    while (pNode->next) {//最后一个节点

        if (pNode->next->val == val) {//pNode节点的下一个节点的数据域 == val
            //找到要删除的元素
            struct Node *dNode = pNode->next;
            pNode->next = dNode->next;
            if (!dNode->next) {
                pNode->next = NULL;
            }
            free(dNode);//释放指针
            --head->val;//更新节点统计
            break;
        }
        pNode = pNode->next;
    }
}

/**
 对于这个问题，有一个很棒的思路， 那就是采用两个指针，一个指针从head开始，另一个从head->next开始，第一个指针每次只走一步，第二个指针每次走两步。正常不存在环的情况下，以第二个指针到达尾节点作为判断的依据，若是存在环，那必定这两个指针会相遇，那么指针相遇便能作为判断单链表中存在环的依据。
 文／shawenlx（简书作者）
 原文链接：http://www.jianshu.com/p/893bdf8b5de6
 著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
 */
//判断单链表中是否存在自环 1代表存在，0则反之
- (int)judgeCircleWithNode:(struct Node *)head{

    if (!head || !head->next){
        return 0;
    }
    struct Node *first = head->next, *second = head->next->next;
    while (second && first) {
        if (first == second) return 1;
        second = second->next->next;
        first = first->next;
    }
    return 0;
}

//除了头结点，翻转整条链表,时间复杂度为O(n)
- (struct Node *)reverseWithNode:(struct Node *)head{

    if (!head || !head->next) {
        NSLog(@"不存在这个链表或只有头节点");
        return head;
    }
    struct Node *pNode = head->next;
    //除了头结点，只有一个节点
    if (!pNode->next) {
        return head;
    }

    struct Node *qNode = pNode->next;
    pNode->next = NULL;
    //除了头结点，只有二个节点
    if (!qNode->next) {

        head->next = qNode;
        qNode->next = pNode;
        return head;
    }
    /**
     * 思路
     * 1、涉及到两个结点，要保存第二个结点的指针域
     * 2、把链表分成两个部分，循环，每次从后面部分取出一个节点，使这个节点的指针域指向前面部分
     * 3、当后面部分只有一个节点时，停止
     */
    //除了头结点，节点数量>=3
    struct Node *rNode = NULL;
    while (qNode->next) {

        rNode = qNode->next;//保存后面部分取出的节点的指针域
        qNode->next = pNode;//后面部分取出的节点指向前面部分

        pNode = qNode;//新的前面部分
        qNode = rNode;//新的后面部分取出节点
    }
    //后面部分最后一个节点指向前面部分(两部分连接到一起)
    rNode->next = pNode;
    head->next = rNode;
    return head;
}

//修改链表中第一个值为val的节点
- (void)changeNode:(struct Node *)head WithChangeVal:(int)changeVal ByVal:(const int)val{

    if (!head || !head->next) {
        NSLog(@"不存在这个链表或只有头节点");
        return;
    }

    struct Node *nNode = head->next;
    while (nNode) {

        if (nNode->val==val) {
            nNode->val = changeVal;
            break;
        }
        nNode = nNode->next;
    }
}

//删除链表的所有节点（保留头节点）
- (void)removeAllWithNode:(struct Node *)head{

    if (!head || !head->next) {
        NSLog(@"不存在这个链表或只有头节点");
        return;
    }
    struct Node *nNode = head;
    struct Node *delNode = nNode->next;
    while (nNode) {

        nNode = delNode->next;
        NSLog(@"delete val:%d",delNode->val);
        free(delNode);
        delNode = nNode;
    }
    head->next = NULL;
}

//打印链表的数据域
- (void)printWithNode:(struct Node *)head{

    if (!head || !head->next) {
        NSLog(@"不存在这个链表或只有头节点");
        return;
    }
    struct Node *nNode = head;
    while (nNode->next) {

        int val = nNode->next->val;
        NSLog(@"val:%d",val);
        nNode = nNode->next;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

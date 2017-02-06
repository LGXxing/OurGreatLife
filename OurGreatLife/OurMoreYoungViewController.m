//
//  OurMoreYoungViewController.m
//  OurGreatLife
//
//  Created by 兴哥哥 on 2016/11/25.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "OurMoreYoungViewController.h"
#import "SNStyleTextView.h"
#import "UIView+SDAutoLayout.h"
#import "OurMainTableViewCell.h"
#import "OurShowImageViewController.h"
@interface OurMoreYoungViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UIScrollView *L_scrollowView;
    UIView * bgView;
}
@end

@implementation OurMoreYoungViewController

- (void)viewDidLoad {
    
    
    self.array = [[NSArray alloc]initWithObjects:@"天魁星 呼保义 宋江",@"天罡星 玉麒麟 卢俊义",@"天机星 智多星 吴用",@"天闲星 入云龙 公孙胜",@"天勇星 大刀 关胜",@"天雄星 豹子头 林冲",@"天猛星 霹雳火 秦明",@"天威星 双鞭 呼延灼",@"天英星 小李广 花荣",@"天贵星 小旋风 柴进",@"天富星 扑天雕 李应",@"天満星 美髯公 朱仝",@"天孤星 花和尚 鲁智深",@"天伤星 行者 武松",@"天立星 双枪将 董平",@"天捷星 没羽箭 张清",@"天暗星 青面獣 杨志",@"天佑星 金枪手 徐宁",@"天空星 急先锋 索超",@"天速星 神行太保 戴宗",@"天异星 赤髪鬼 刘唐",@"天杀星 黒旋风 李逵",@"天微星 九纹龙 史进",@"天究星 没遮拦 穆弘",@"天退星 挿翅虎 雷横",@"天寿星 混江龙 李俊",@"天剣星 立地太歳 阮小二",@"天平星 船火児 张横",@"天罪星 短命二郎 阮小五",@"天损星 浪里白跳 张顺",@"天败星 活阎罗 阮小七",@"天牢星 病关索 杨雄",@"天慧星 拚命三郎 石秀",@" 天暴星 两头蛇 解珍",@"天哭星 双尾蝎 解宝",@"天巧星 浪子 燕青", nil];
    self.imageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36", nil];
    
    
    [super viewDidLoad];
    switch (_index) {
        case 0:
            [self godSword];
            break;
        case 1:
            [self gotoQuack];
            break;
        case 2:
            [self gotoTianLong];
            break;
        case 3:
            [self gotoBother];
            break;
        case 4:
            [self gotoSuiTang];
            break;
        case 5:
            [self gotoSanGuo];
            break;
        case 6:
            [self gotoBaoQing];
            break;
        case 7:
            [self gotoXiaoLe];
            break;
        
        default:
            break;
    }
    
    
    // Do any additional setup after loading the view.
}
- (void)godSword
{
    [self setScrollView];
    
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"981477617867109.jpg"];
    [L_scrollowView addSubview:bgImage];
    
    
    NSString *text = @"   “剑气纵横三万里，一剑光寒十九洲”，神剑山庄三少爷谢晓峰惊才绝艳，十年来历经上千大战未尝一败，被天下人尊为“剑神”。传奇剑客燕十三一直以谢晓峰为目标，苦修剑道，终于在生死边缘悟出惊天地泣鬼神的“绝命十三剑”。一时之间，江湖沸腾，然而，就在燕十三赶到神剑山庄下战书的时候，迎接他的，却是三少爷谢晓峰的灵柩。燕十三因痛失对手大感失望，此时神秘女子慕容秋荻出现并告知燕十三，谢晓峰并没有死，要想找到他决战，燕十三就必须要替她杀一个人.\n    都说《三少爷的剑》是古龙先生晚年对“武侠”做出了深层次的反思，那他到底做了什么反思，我一直没明白。直到如今的我看了尔冬升徐克翻拍曾经的他们的经典《三少爷的剑》，相信大家都看到了两位导演的努力，他们也做出了反思，也做出了创新。深入浅出的表达了某些东西，就不细说。总而言之，真正要表达的不是个人武艺的高低，不仅仅追求“天下第一”武林至尊，个人的成败或者荣誉。因为哪些对于“大义”来说都太肤浅，他们正在要做的事情是，让每个人都有一颗以侠肝义胆，去匡扶整个社会的正义！这件事放在任何一个年代都是最重要的事。一个社会的风气，一个名族的风骨，铸就一个国家的脊梁。\n        当人们醉心于燕十三的绝命的士四剑的时候，燕十三自.明.志，他不杀三少爷，正是他明白了这个一个道理。不能杀，因为他是我们一种的“精神“，我们的”罗宾汉“，会体察民间疾苦”罗宾汉“。而不是高高在上，不染世俗的”三少爷“。而燕十三的”死“，笔者认为是多余的、败笔，累赘，画蛇添足。让燕十三、铁氏兄弟等追随三少爷，一起匡扶正义。死了一个人，还有千千万万个”谢晓峰“、”罗宾汉“！这才是出路，武侠的出路。";
    SNStyleTextView * textSty = [[SNStyleTextView alloc]initWithFrame:CGRectMake(10*default_scale, 280*default_scale, SCREENWIDTH-20*default_scale, 700*default_scale)];
    textSty.text = text;
    [textSty setEditable:NO];
    [textSty setAttributedText:[textSty setFontSize:16 ofRange:NSMakeRange(0, text.length)]];
    [L_scrollowView addSubview:textSty];
    [textSty setAttributedText:[textSty setFontSize:20 ofRange:[text rangeOfString:@"剑气纵横三万里，一剑光寒十九洲"]]];
   [textSty setAttributedText: [textSty setFontColor:[UIColor redColor] ofRange:[text rangeOfString:@"剑气纵横三万里，一剑光寒十九洲"]]];
    [textSty setAttributedText:[textSty setFontColor:[UIColor orangeColor] ofRange:[text rangeOfString:@"燕十三"]]];
    [textSty setAttributedText:[textSty setFontColor:[UIColor cyanColor] ofRange:[text rangeOfString:@"慕容秋荻"]]];
    
    UILabel * titleLab =[[UILabel alloc]initWithFrame:CGRectMake(10*default_scale, 220*default_scale, SCREENWIDTH-20*default_scale, 20*default_scale)];
    titleLab.textAlignment = 1;
    titleLab.text = @"三少爷的剑";
    titleLab.textColor = default_black;
    titleLab.font = systemFontOfSize(20);
    [L_scrollowView addSubview:titleLab];
    
    UILabel * desLab =[[UILabel alloc]initWithFrame:CGRectMake(10*default_scale, 250*default_scale, SCREENWIDTH-20*default_scale, 20*default_scale)];
    desLab.textAlignment = 1;
    desLab.text = @"文字   兴哥哥";
    desLab.textColor = defailt_gray_666666;
    desLab.font = systemFontOfSize(14);
    [L_scrollowView addSubview:desLab];
    
    UILabel * redLab =[[UILabel alloc]initWithFrame:CGRectMake(2*default_scale, 220*default_scale, 10*default_scale, 50*default_scale)];
    redLab.backgroundColor =Default_gray_CCCCCC;
    [L_scrollowView addSubview:redLab];
    [L_scrollowView setScrollsToTop:YES];
    
    
    
}
- (void)gotoQuack
{
    
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"0914312616-2.jpg"];
    
    [self setScrollView];
    [L_scrollowView addSubview:bgImage];
    [L_scrollowView setScrollsToTop:YES];
    UILabel * titleLab =[[UILabel alloc]initWithFrame:CGRectMake(10*default_scale, 220*default_scale, SCREENWIDTH-20*default_scale, 20*default_scale)];
    titleLab.textAlignment = 1;
    titleLab.text = @"沧海一声笑";
    titleLab.textColor = default_red_FF4A31;
    titleLab.font = systemFontOfSize(20);
    [L_scrollowView addSubview:titleLab];
    
    UIImageView* nextImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 260*default_scale, SCREENWIDTH, 200*default_scale)];
    nextImage.image = [UIImage imageNamed:@"7247a942b08245df6e0d672f8c922006.jpg"];
    [L_scrollowView addSubview:nextImage];

    
}
- (void)gotoTianLong
{
    [self setScrollView];
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"a7f35fddc58918b0_1_1412061994-2.jpg"];
    bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 210*default_scale, SCREENWIDTH, 420*default_scale)];
    bgView.backgroundColor = default_black;
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, 0, bgView.frame.size.width, 420*default_scale);
    [bgView addSubview:effectview];
    [L_scrollowView addSubview:bgView];
    [self initUI];
    
    [L_scrollowView addSubview:bgImage];
    
    
}
- (void)gotoBother
{
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"20131210111657-1236769374.jpg-2"];
   
    [self setTableView];
    [L_scrollowView addSubview:bgImage];
    
}
- (void)gotoSuiTang
{
    
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"43dd932397dda14457ce7b18b2b7d0a20df4865b.jpg"];
    [self.view addSubview:bgImage];
    
}
- (void)gotoSanGuo
{
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"U2184P28T52D3604F872DT20081210175400.jpg"];
    [self.view addSubview:bgImage];
    
    
}
- (void)gotoBaoQing
{
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"20131126092616-1582937552-2.jpg"];
    [self.view addSubview:bgImage];
    
    
}
- (void)gotoXiaoLe
{
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"u=1331536250,660190939&fm=23&gp=0.jpg"];
    [self.view addSubview:bgImage];
    
    
}
- (void)setScrollView
{
    
    L_scrollowView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    L_scrollowView.contentSize =CGSizeMake(0, 1000*default_scale);
    
    [self.view addSubview:L_scrollowView];
    
    
    
}
- (void)initUI
{
    
    UIButton * firstBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    firstBtn.layer .borderWidth = 3*default_scale;
    firstBtn.layer.borderColor = Default_gray_CCCCCC.CGColor;
    firstBtn.backgroundColor = [UIColor redColor];
    [firstBtn setBackgroundImage:[UIImage imageNamed:@"4e6a9b2f-2e2d-4c11-bb33-6cd6547f98bd.jpg"] forState:UIControlStateNormal];
    
    UIButton * secondBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    secondBtn.layer .borderWidth = 3*default_scale;
    secondBtn.layer.borderColor = Default_gray_CCCCCC.CGColor;
    secondBtn.backgroundColor = [UIColor redColor];
    [secondBtn setBackgroundImage:[UIImage imageNamed:@"0005018391276916_b.jpg"] forState:UIControlStateNormal];

    
    UIButton * thiedBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    thiedBtn.layer .borderWidth = 3*default_scale;
    thiedBtn.layer.borderColor = Default_gray_CCCCCC.CGColor;
    thiedBtn.backgroundColor = [UIColor redColor];
    [thiedBtn setBackgroundImage:[UIImage imageNamed:@"1288606_145507_1_lit.jpg"] forState:UIControlStateNormal];

    
    [bgView sd_addSubviews:@[firstBtn,secondBtn,thiedBtn]];
    
    
    firstBtn.sd_layout
    .topSpaceToView(bgView,10*default_scale)
    .leftSpaceToView(bgView,SCREENWIDTH/2-50*default_scale)
    .rightSpaceToView(bgView,SCREENWIDTH/2-50*default_scale)
    .heightIs(160);
    
    secondBtn.sd_layout
    .topSpaceToView(firstBtn,5*default_scale)
    .leftSpaceToView(bgView,20*default_scale)
    .heightIs(160*default_scale)
    .widthIs(100*default_scale);
    
    thiedBtn.sd_layout
    .topSpaceToView(firstBtn,5*default_scale)
    .rightSpaceToView(bgView,20*default_scale)
    .heightIs(160*default_scale)
    .widthIs(100*default_scale);
   
    
    
    
    
    
    
    
}
- (void)setTableView
{
    UITableView * BotherTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-154) style:UITableViewStylePlain];
    BotherTableView.translatesAutoresizingMaskIntoConstraints = NO;
    BotherTableView .delegate =self;
    BotherTableView .dataSource = self;
    [self.view addSubview:BotherTableView];
//    [L_scrollowView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":BotherTableView}]];
//    
//    [L_scrollowView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[tableView]-0-|" options:kNilOptions metrics:nil views:@{@"tableView":BotherTableView}]];
    UIImageView* bgImage =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200*default_scale)];
    bgImage.image = [UIImage imageNamed:@"20131210111657-1236769374.jpg-2"];
    BotherTableView.tableHeaderView = bgImage;
    BotherTableView.rowHeight = 90*default_scale;
    
    BotherTableView.backgroundColor = [UIColor redColor];
}
 -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 36;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * identifier = @"cell";
    OurMainTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell =[[OurMainTableViewCell alloc]initWithBotherIdsentifier:identifier];
    }
    cell.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageArray[indexPath.row]]];
    cell.nameLable.text = self.array[indexPath.row];
    if (indexPath.row%2 == 1) {
        cell.instrLable.text = @"梁山好汉全伙在此";
    }else{
        cell.instrLable.text = @"忠义双全，替天行道";
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OurShowImageViewController * vc = [[OurShowImageViewController alloc]init];
    OurMainTableViewCell * cell =[tableView cellForRowAtIndexPath:indexPath];
    vc.titleName = cell.nameLable.text;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

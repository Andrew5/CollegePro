//
//  AdaptionListViewController.m
//  Test
//
//  Created by Uwaysoft on 2018/7/30.
//  Copyright © 2018年 Rillakkuma. All rights reserved.
//

#import "AdaptionListViewController.h"
#import "CustomerTitleModel.h"
#import "MyPersionTableViewCell.h"

@interface AdaptionListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
	NSMutableArray *chatArray;
    UITableView *tableViewMy;
}
@end

@implementation AdaptionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self loadData];
	[self loadUI];
}
- (void)loadData{
	//        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"newsTest" ofType:@"plist"];
	//        NSMutableDictionary *jsonResult = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
	//        if ([jsonResult[@"code"] isEqualToString:@"0"]){
	//            _arr_cockpit = [NSMutableArray array];
	//            if ([jsonResult[@"body"][@"mainName"] isEqualToString:@"G"]) {
	//                NSMutableArray *arr = [NSMutableArray array];
	//                [arr addObject:[CustomerCockpitModel mj_objectWithKeyValues:jsonResult[@"body"][@"G11"]]];
	//                [arr addObject:[CustomerCockpitModel mj_objectWithKeyValues:jsonResult[@"body"][@"G02"]]];
	//                [arr addObject:[CustomerCockpitModel mj_objectWithKeyValues:jsonResult[@"body"][@"G10"]]];
	//                [arr addObject:[CustomerCockpitModel mj_objectWithKeyValues:jsonResult[@"body"][@"G03"]]];
	//                [arr addObject:[CustomerCockpitModel mj_objectWithKeyValues:jsonResult[@"body"][@"G04"]]];
	//                [_arr_cockpit addObject:arr];
	//            }
	//            NSLog(@"arr_cockpit %@",_arr_cockpit);
	//        }
	
	
	chatArray = [NSMutableArray array];
	NSArray *arrvaluer = @[@"随着河北省统计局7月25日发布上半年该省的经济运行情况，今年上半年，经济十强省的排名有了清晰的呈现",@"据澎湃新闻梳理统计，与去年同期相比，今年上半年，经济总量（GDP）排名进入前十的省份并无变化，其中中部省份占据三席，分别是河南、湖北和湖南",@"具体来看，去年上半年，按经济总量排名，广东、江苏、山东、浙江和河南排在前五位，今年这一排名保持不变。上述5个省份也连续两年上半年经济总量都在2万亿元以上",@"与去年同期相比，经济总量排位出现变化的是第六到第八位",@"2017年上半年，河北经济总量实现16404.9亿元，排在全国第六位，经济增速为6.8%",@"随着河北省统计局7月25日发布上半年该省的经济运行情况，今年上半年，经济十强省的排名有了清晰的呈现",@"据澎湃新闻梳理统计，与去年同期相比，今年上半年，经济总量（GDP）排名进入前十的省份并无变化，其中中部省份占据三席，分别是河南、湖北和湖南",@"具体来看，去年上半年，按经济总量排名，广东、江苏、山东、浙江和河南排在前五位，今年这一排名保持不变。上述5个省份也连续两年上半年经济总量都在2万亿元以上",@"与去年同期相比，经济总量排位出现变化的是第六到第八位",@"2017年上半年，河北经济总量实现16404.9亿元，排在全国第六位，经济增速为6.8%"];
	NSArray *arrkey = @[@"In an interview with the media, he said: I am not clear for this thing. Indeed, for him, the listing is just a small step",@"Now, this sense of separation is still in the tear.",@"In 2006, he and Li Kaifu went back to Chinese, tired of Sino US two round-trip year, Huang Zheng left Google, and achieve financial freedom after cash",@"The departure from Google, he did not expect to have to do Google Greater China President Li Kaifu, in the two years after the resignation of the founder of innovation works",@"But Li Kaifu did not expect that the programmer from 80 guy, in ten years will lead a start-up company in the U.S.",@"In an interview with the media, he said: I am not clear for this thing. Indeed, for him, the listing is just a small step",@"Now, this sense of separation is still in the tear.",@"In 2006, he and Li Kaifu went back to Chinese, tired of Sino US two round-trip year, Huang Zheng left Google, and achieve financial freedom after cash",@"The departure from Google, he did not expect to have to do Google Greater China President Li Kaifu, in the two years after the resignation of the founder of innovation works",@"But Li Kaifu did not expect that the programmer from 80 guy, in ten years will lead a start-up company in the U.S."];
	//10条数据
	
	for (int i = 0; i<arrkey.count; i++) {
		CustomerTitleModel *model = [CustomerTitleModel alloc];
		model.newsTitle= arrkey[i];
		model.newsDocSubject = arrvaluer[i];
		[chatArray addObject:model];
	}
	[tableViewMy reloadData];
	
}
- (void)loadUI{
	tableViewMy = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
	tableViewMy.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
	tableViewMy.backgroundColor = [UIColor whiteColor];
	tableViewMy.delegate = self;
	tableViewMy.dataSource = self;
	tableViewMy.showsVerticalScrollIndicator = NO;//不显示右侧滑块
	//分割线Inset
	tableViewMy.separatorInset = UIEdgeInsetsZero;
	[self.view addSubview:tableViewMy];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	LHLog(@"");
	return chatArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	MyPersionTableViewCell *cell_Discover = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyPersionTableViewCell class])];
	if (cell_Discover == nil) {
		cell_Discover = [[MyPersionTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass([MyPersionTableViewCell class])];
	}
	CustomerTitleModel *model = chatArray[indexPath.row];
	cell_Discover.model = model;
	cell_Discover.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
	LHLog(@"");
	return cell_Discover;
	
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CustomerTitleModel *model = chatArray[indexPath.row];
	LHLog(@"");
	return model.cellHeight;
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

/// <reference path="jquery-1.9.1.min.js" />
LevelEnum = { LevelAdmin: 0, LevelMember: 1 };
AccountLevelEnum = { 总监: 0, 大股东: 1, 股东: 2, 总代理: 3, 代理: 4, 会员: 5, 直属会员: 6, 子账号: 7 };
KindNameEnum = { 一定位: "一定位", 二定位: "二定位", 三定位: "三定位", 四定位: "四定位", 一字现: "一字现", 二字现: "二字现", 三字现: "三字现", 四字现: "四字现" }
BallIdEnum = { 口口XX: 5, 口X口X: 6, 口XX口: 7, X口X口: 8, X口口X: 9, XX口口: 10, 口口口X: 11, 口口X口: 12, 口X口口: 13, X口口口: 14, 四定位: 15, 一字现: 16, 二字现: 17, 三字现: 18, 四字现: 19, XXX口口:20}
ChipInModeEnum = { 二定位: 1, 快打: 2, 快选: 3 };
//快选设置
SpeedSelectEnum = { s_weizhi: 1, s_hefen: 2, s_bdwhefen: 4, zhifenwei: 8, quandao: 16, paichu: 32, chenghao: 64, fushi: 128, shong1: 256, shong2: 512, shong3: 1024, shong4: 2048, xiongdi1: 4096, xiongdi2: 8192, xiongdi3: 16384, duishu: 32768, dan: 65536, shuang: 131072, shangjiang: 262144, sidingwei: 524288 };

if (document.all) {
    window.resizeTo(screen.availWidth, screen.availHeight);
}
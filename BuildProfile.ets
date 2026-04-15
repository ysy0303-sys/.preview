if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface myPage_Params {
    userInfo?: UserInfo;
    currentTab?: TabType;
    showEditUserDialog?: boolean;
    editName?: string;
    editSchool?: string;
    editMajor?: string;
    avatarUri?: string;
}
import router from "@ohos:router";
import picker from "@ohos:file.picker";
import promptAction from "@ohos:promptAction";
// 与 Index 保持一致的类型
type TabType = 'home' | 'plan' | 'recommend' | 'message' | 'mine';
// 接口定义
interface UserInfo {
    name: string;
    school: string;
    major: string;
    studentId: string;
}
// 模拟用户数据
const mockUserInfo: UserInfo = {
    name: '王同学',
    school: 'XX大学',
    major: '计算机科学与技术',
    studentId: '2024001',
};
class myPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__userInfo = new ObservedPropertyObjectPU(JSON.parse(JSON.stringify(mockUserInfo)), this, "userInfo");
        this.__currentTab = new ObservedPropertySimplePU('mine', this, "currentTab");
        this.__showEditUserDialog = new ObservedPropertySimplePU(false, this, "showEditUserDialog");
        this.__editName = new ObservedPropertySimplePU('', this, "editName");
        this.__editSchool = new ObservedPropertySimplePU('', this, "editSchool");
        this.__editMajor = new ObservedPropertySimplePU('', this, "editMajor");
        this.__avatarUri = new ObservedPropertySimplePU('' // 正确类型，存放图片真实uri
        , this, "avatarUri");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: myPage_Params) {
        if (params.userInfo !== undefined) {
            this.userInfo = params.userInfo;
        }
        if (params.currentTab !== undefined) {
            this.currentTab = params.currentTab;
        }
        if (params.showEditUserDialog !== undefined) {
            this.showEditUserDialog = params.showEditUserDialog;
        }
        if (params.editName !== undefined) {
            this.editName = params.editName;
        }
        if (params.editSchool !== undefined) {
            this.editSchool = params.editSchool;
        }
        if (params.editMajor !== undefined) {
            this.editMajor = params.editMajor;
        }
        if (params.avatarUri !== undefined) {
            this.avatarUri = params.avatarUri;
        }
    }
    updateStateVars(params: myPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__userInfo.purgeDependencyOnElmtId(rmElmtId);
        this.__currentTab.purgeDependencyOnElmtId(rmElmtId);
        this.__showEditUserDialog.purgeDependencyOnElmtId(rmElmtId);
        this.__editName.purgeDependencyOnElmtId(rmElmtId);
        this.__editSchool.purgeDependencyOnElmtId(rmElmtId);
        this.__editMajor.purgeDependencyOnElmtId(rmElmtId);
        this.__avatarUri.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__userInfo.aboutToBeDeleted();
        this.__currentTab.aboutToBeDeleted();
        this.__showEditUserDialog.aboutToBeDeleted();
        this.__editName.aboutToBeDeleted();
        this.__editSchool.aboutToBeDeleted();
        this.__editMajor.aboutToBeDeleted();
        this.__avatarUri.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    // 深拷贝mock数据
    private __userInfo: ObservedPropertyObjectPU<UserInfo>;
    get userInfo() {
        return this.__userInfo.get();
    }
    set userInfo(newValue: UserInfo) {
        this.__userInfo.set(newValue);
    }
    private __currentTab: ObservedPropertySimplePU<TabType>;
    get currentTab() {
        return this.__currentTab.get();
    }
    set currentTab(newValue: TabType) {
        this.__currentTab.set(newValue);
    }
    // 个人信息修改弹窗相关状态
    private __showEditUserDialog: ObservedPropertySimplePU<boolean>;
    get showEditUserDialog() {
        return this.__showEditUserDialog.get();
    }
    set showEditUserDialog(newValue: boolean) {
        this.__showEditUserDialog.set(newValue);
    }
    private __editName: ObservedPropertySimplePU<string>;
    get editName() {
        return this.__editName.get();
    }
    set editName(newValue: string) {
        this.__editName.set(newValue);
    }
    private __editSchool: ObservedPropertySimplePU<string>;
    get editSchool() {
        return this.__editSchool.get();
    }
    set editSchool(newValue: string) {
        this.__editSchool.set(newValue);
    }
    private __editMajor: ObservedPropertySimplePU<string>;
    get editMajor() {
        return this.__editMajor.get();
    }
    set editMajor(newValue: string) {
        this.__editMajor.set(newValue);
    }
    private __avatarUri: ObservedPropertySimplePU<string>; // 正确类型，存放图片真实uri
    get avatarUri() {
        return this.__avatarUri.get();
    }
    set avatarUri(newValue: string) {
        this.__avatarUri.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("entry/src/main/ets/pages/myPage.ets(39:5)", "entry");
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(40:7)", "entry");
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#F8F9FC');
            Column.expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP]);
            Column.backgroundImage({ "id": 16777260, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Column.backgroundImageSize(ImageSize.Cover);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(41:9)", "entry");
            Column.width('100%');
            Column.layoutWeight(1);
            Column.alignItems(HorizontalAlign.Start);
            Column.justifyContent(FlexAlign.Start);
        }, Column);
        this.buildUserInfoCard.bind(this)();
        this.builderother.bind(this)();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 底部导航
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(51:9)", "entry");
            // 底部导航
            Row.width('100%');
            // 底部导航
            Row.height(60);
            // 底部导航
            Row.backgroundColor(Color.White);
            // 底部导航
            Row.justifyContent(FlexAlign.Center);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(52:11)", "entry");
            Column.layoutWeight(1);
            Column.onClick(() => {
                this.currentTab = 'home';
                try {
                    router.pushUrl({ url: 'pages/Index' });
                }
                catch (e) {
                    console.error('首页跳转失败:', e);
                }
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("🏠");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(53:13)", "entry");
            Text.fontSize(24);
            Text.fontColor(this.currentTab === 'home' ? '#2563EB' : '#6B7280');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("首页");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(54:13)", "entry");
            Text.fontColor(this.currentTab === 'home' ? '#2563EB' : '#6B7280');
            Text.fontSize(14);
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(64:11)", "entry");
            Column.layoutWeight(1);
            Column.onClick(() => {
                this.currentTab = 'plan';
                try {
                    router.pushUrl({ url: 'pages/GoalsPage' });
                }
                catch (e) {
                    console.error('记录页跳转失败:', e);
                }
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("📝");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(65:13)", "entry");
            Text.fontSize(24);
            Text.fontColor(this.currentTab === 'plan' ? '#2563EB' : '#6B7280');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("目标");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(66:13)", "entry");
            Text.fontColor(this.currentTab === 'plan' ? '#2563EB' : '#6B7280');
            Text.fontSize(14);
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(76:11)", "entry");
            Column.layoutWeight(1);
            Column.onClick(() => {
                this.currentTab = 'recommend';
                try {
                    router.pushUrl({ url: 'pages/recommendPage' });
                }
                catch (e) {
                    console.error('规划页跳转失败:', e);
                }
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("📅");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(77:13)", "entry");
            Text.fontSize(24);
            Text.fontColor(this.currentTab === 'recommend' ? '#2563EB' : '#6B7280');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("推荐");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(78:13)", "entry");
            Text.fontColor(this.currentTab === 'recommend' ? '#2563EB' : '#6B7280');
            Text.fontSize(14);
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(88:11)", "entry");
            Column.layoutWeight(1);
            Column.onClick(() => {
                this.currentTab = 'message';
                router.pushUrl({ url: 'pages/MessagePage' });
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("✉️");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(89:13)", "entry");
            Text.fontSize(24);
            Text.fontColor(this.currentTab === 'message' ? '#2563EB' : '#6B7280');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("消息");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(90:13)", "entry");
            Text.fontColor(this.currentTab === 'message' ? '#2563EB' : '#6B7280');
            Text.fontSize(14);
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(100:11)", "entry");
            Column.layoutWeight(1);
            Column.onClick(() => {
                this.currentTab = 'mine';
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("👤");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(101:13)", "entry");
            Text.fontSize(24);
            Text.fontColor(this.currentTab === 'mine' ? '#2563EB' : '#6B7280');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create("我的");
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(102:13)", "entry");
            Text.fontColor(this.currentTab === 'mine' ? '#2563EB' : '#6B7280');
            Text.fontSize(14);
        }, Text);
        Text.pop();
        Column.pop();
        // 底部导航
        Row.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            // 个人信息修改弹窗
            if (this.showEditUserDialog) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Stack.create();
                        Stack.debugLine("entry/src/main/ets/pages/myPage.ets(121:9)", "entry");
                        Stack.width('100%');
                        Stack.height('100%');
                        Stack.alignContent(Alignment.Center);
                        Stack.zIndex(999);
                    }, Stack);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Column.create();
                        Column.debugLine("entry/src/main/ets/pages/myPage.ets(122:11)", "entry");
                        Column.width('100%');
                        Column.height('100%');
                        Column.backgroundColor('rgba(0,0,0,0.3)');
                        Column.onClick(() => {
                            this.showEditUserDialog = false;
                        });
                    }, Column);
                    Column.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Column.create();
                        Column.debugLine("entry/src/main/ets/pages/myPage.ets(130:11)", "entry");
                        Column.width('80%');
                        Column.padding(20);
                        Column.backgroundColor(Color.White);
                        Column.borderRadius(12);
                        Column.shadow({ radius: 8 });
                    }, Column);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('修改个人信息');
                        Text.debugLine("entry/src/main/ets/pages/myPage.ets(131:13)", "entry");
                        Text.fontSize(18);
                        Text.fontWeight(FontWeight.Medium);
                        Text.margin({ bottom: 20 });
                        Text.alignSelf(ItemAlign.Center);
                    }, Text);
                    Text.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        // 头像区域
                        Row.create();
                        Row.debugLine("entry/src/main/ets/pages/myPage.ets(138:13)", "entry");
                        // 头像区域
                        Row.width('100%');
                        // 头像区域
                        Row.margin({ bottom: 15 });
                        // 头像区域
                        Row.alignItems(VerticalAlign.Center);
                    }, Row);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('头像：');
                        Text.debugLine("entry/src/main/ets/pages/myPage.ets(139:15)", "entry");
                        Text.fontSize(14);
                        Text.width(60);
                    }, Text);
                    Text.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Image.create(this.avatarUri || { "id": 16777243, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
                        Image.debugLine("entry/src/main/ets/pages/myPage.ets(142:15)", "entry");
                        Image.width(50);
                        Image.height(50);
                        Image.borderRadius(25);
                    }, Image);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('更换');
                        Text.debugLine("entry/src/main/ets/pages/myPage.ets(146:15)", "entry");
                        Text.fontSize(14);
                        Text.fontColor('#2563EB');
                        Text.margin({ left: 10 });
                        Text.onClick(() => {
                            this.selectAvatar();
                        });
                    }, Text);
                    Text.pop();
                    // 头像区域
                    Row.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        TextInput.create({ placeholder: '昵称', text: this.editName });
                        TextInput.debugLine("entry/src/main/ets/pages/myPage.ets(158:13)", "entry");
                        TextInput.width('100%');
                        TextInput.padding(10);
                        TextInput.backgroundColor('#F8F9FC');
                        TextInput.borderRadius(8);
                        TextInput.margin({ bottom: 15 });
                        TextInput.onChange(v => this.editName = v);
                    }, TextInput);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        TextInput.create({ placeholder: '学校', text: this.editSchool });
                        TextInput.debugLine("entry/src/main/ets/pages/myPage.ets(166:13)", "entry");
                        TextInput.width('100%');
                        TextInput.padding(10);
                        TextInput.backgroundColor('#F8F9FC');
                        TextInput.borderRadius(8);
                        TextInput.margin({ bottom: 15 });
                        TextInput.onChange(v => this.editSchool = v);
                    }, TextInput);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        TextInput.create({ placeholder: '专业', text: this.editMajor });
                        TextInput.debugLine("entry/src/main/ets/pages/myPage.ets(174:13)", "entry");
                        TextInput.width('100%');
                        TextInput.padding(10);
                        TextInput.backgroundColor('#F8F9FC');
                        TextInput.borderRadius(8);
                        TextInput.margin({ bottom: 20 });
                        TextInput.onChange(v => this.editMajor = v);
                    }, TextInput);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Flex.create({ justifyContent: FlexAlign.SpaceAround });
                        Flex.debugLine("entry/src/main/ets/pages/myPage.ets(182:13)", "entry");
                    }, Flex);
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Button.createWithLabel('取消');
                        Button.debugLine("entry/src/main/ets/pages/myPage.ets(183:15)", "entry");
                        Button.width(100);
                        Button.height(40);
                        Button.onClick(() => {
                            this.showEditUserDialog = false;
                        });
                    }, Button);
                    Button.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Button.createWithLabel('保存');
                        Button.debugLine("entry/src/main/ets/pages/myPage.ets(189:15)", "entry");
                        Button.width(100);
                        Button.height(40);
                        Button.backgroundColor('#2563EB');
                        Button.fontColor(Color.White);
                        Button.onClick(() => {
                            if (this.editName.trim())
                                this.userInfo.name = this.editName;
                            if (this.editSchool.trim())
                                this.userInfo.school = this.editSchool;
                            if (this.editMajor.trim())
                                this.userInfo.major = this.editMajor;
                            this.showEditUserDialog = false;
                        });
                    }, Button);
                    Button.pop();
                    Flex.pop();
                    Column.pop();
                    Stack.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                });
            }
        }, If);
        If.pop();
        Stack.pop();
    }
    // 选择头像
    async selectAvatar() {
        try {
            const photoPicker = new picker.PhotoViewPicker();
            const options = new picker.PhotoSelectOptions();
            options.maxSelectNumber = 1;
            const result = await photoPicker.select(options);
            if (result && result.photoUris && result.photoUris.length > 0) {
                this.avatarUri = result.photoUris[0];
            }
        }
        catch (e) {
            console.error("选择头像失败", e);
        }
    }
    // 用户信息卡片
    buildUserInfoCard(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(237:5)", "entry");
            Column.width('100%');
            Column.height(220);
            Column.borderRadius(16);
            Column.margin({ left: 16, right: 16 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(238:7)", "entry");
            Row.width('100%');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.avatarUri || { "id": 16777243, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(239:9)", "entry");
            Image.width(90);
            Image.height(90);
            Image.margin({ left: 40, top: 20 });
            Image.borderRadius(50);
            Image.alignSelf(ItemAlign.Start);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777240, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(246:9)", "entry");
            Image.height(30);
            Image.width(30);
            Image.alignSelf(ItemAlign.End);
            Image.fillColor('#666666');
            Image.margin({ left: 160, bottom: 50 });
            Image.onClick(() => {
                this.editName = this.userInfo.name;
                this.editSchool = this.userInfo.school;
                this.editMajor = this.userInfo.major;
                this.showEditUserDialog = true;
            });
        }, Image);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.userInfo.name);
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(260:7)", "entry");
            Text.fontSize(30);
            Text.fontWeight(FontWeight.Medium);
            Text.alignSelf(ItemAlign.Start);
            Text.margin({ left: 30, top: 15 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.userInfo.school + ' · ' + this.userInfo.major);
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(266:7)", "entry");
            Text.fontSize(20);
            Text.fontColor('#666666');
            Text.margin({ top: 5, left: 30 });
            Text.alignSelf(ItemAlign.Start);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 学号信息
            Text.create('学号：' + this.userInfo.studentId);
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(273:7)", "entry");
            // 学号信息
            Text.fontSize(18);
            // 学号信息
            Text.fontColor('#666666');
            // 学号信息
            Text.margin({ top: 5, left: 30 });
            // 学号信息
            Text.alignSelf(ItemAlign.Start);
        }, Text);
        // 学号信息
        Text.pop();
        Column.pop();
    }
    //其他
    builderother(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(288:5)", "entry");
            Column.backgroundColor('#80F8F9FC');
            Column.width('97%');
            Column.borderRadius(40);
            Column.height(250);
            Column.margin({ top: 50, left: 7 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/myPage.ets(289:7)", "entry");
            Column.padding(10);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(290:9)", "entry");
            Row.onClick(() => {
                router.pushUrl({
                    url: 'pages/myfk'
                }, router.RouterMode.Single);
            });
            Row.margin({ top: 20, left: 15 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777224, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(291:11)", "entry");
            Image.width(30);
            Image.height(30);
            Image.fillColor(Color.Grey);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('意见反馈');
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(295:11)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize(25);
            Text.layoutWeight(1);
            Text.margin({ left: 5 });
            Text.fontColor(Color.Grey);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(301:11)", "entry");
            Image.width(40);
            Image.height(25);
            Image.fillColor(Color.Grey);
        }, Image);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(313:9)", "entry");
            Row.margin({ top: 20, left: 15 });
            Row.onClick(() => {
                this.showHelpDialog();
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777237, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(314:11)", "entry");
            Image.width(30);
            Image.height(30);
            Image.fillColor(Color.Grey);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('帮助中心');
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(317:11)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize(25);
            Text.layoutWeight(1);
            Text.margin({ left: 5 });
            Text.fontColor(Color.Grey);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(322:11)", "entry");
            Image.width(40);
            Image.height(25);
            Image.fillColor(Color.Grey);
        }, Image);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(331:9)", "entry");
            Row.margin({ top: 20, left: 15 });
            Row.onClick(() => {
                this.showAboutDialog();
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777236, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(332:11)", "entry");
            Image.width(30);
            Image.height(30);
            Image.fillColor(Color.Grey);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('关于我们');
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(335:11)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize(25);
            Text.layoutWeight(1);
            Text.margin({ left: 5 });
            Text.fontColor(Color.Grey);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(340:11)", "entry");
            Image.width(40);
            Image.height(25);
            Image.fillColor(Color.Grey);
        }, Image);
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/myPage.ets(349:9)", "entry");
            Row.margin({ top: 20, left: 15 });
            Row.onClick(() => {
                this.showPrivacyDialog();
            });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777248, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(350:11)", "entry");
            Image.width(30);
            Image.height(30);
            Image.fillColor(Color.Grey);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('用户隐私');
            Text.debugLine("entry/src/main/ets/pages/myPage.ets(353:11)", "entry");
            Text.fontColor(Color.Black);
            Text.fontSize(25);
            Text.layoutWeight(1);
            Text.margin({ left: 5 });
            Text.fontColor(Color.Grey);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.example.educationapplication", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/myPage.ets(358:11)", "entry");
            Image.width(40);
            Image.height(25);
            Image.fillColor(Color.Grey);
        }, Image);
        Row.pop();
        Column.pop();
        Column.pop();
    }
    // 帮助中心弹窗
    private showHelpDialog(): void {
        promptAction.showDialog({
            title: '帮助中心',
            message: '常见问题解答：\n\n' +
                '1. 如何修改个人信息？\n' +
                '   点击头像旁的编辑图标即可修改昵称、学校、专业等信息。\n\n' +
                '2. 如何设置学习目标？\n' +
                '   在底部导航栏点击"目标"页面，可以添加和管理学习目标。\n\n' +
                '3. 如何获取学习推荐？\n' +
                '   在底部导航栏点击"推荐"页面，系统会根据您的学习情况推荐内容。\n\n' +
                '4. 意见反馈后多久回复？\n' +
                '   我们将在2个工作日内处理您的反馈。',
            buttons: [
                { text: '我知道了', color: '#2563EB' }
            ]
        });
    }
    // 关于我们弹窗
    private showAboutDialog(): void {
        promptAction.showDialog({
            title: '关于我们',
            message: '学习助手 v1.0.0\n\n' +
                '一款帮助大学生高效学习、规划目标的智能助手应用。\n\n' +
                '主要功能：\n' +
                '• 学习目标管理\n' +
                '• 个性化学习推荐\n' +
                '• 学习进度跟踪\n' +
                '© 2026 学习助手',
            buttons: [
                { text: '关闭', color: '#2563EB' }
            ]
        });
    }
    // 用户隐私弹窗
    private showPrivacyDialog(): void {
        promptAction.showDialog({
            title: '用户隐私政策',
            message: '我们高度重视您的隐私保护：\n\n' +
                '1. 信息收集范围：\n' +
                '   我们仅收集必要的个人信息，包括姓名、学校、专业、学号等，用于提供个性化学习服务。\n\n' +
                '2. 信息使用方式：\n' +
                '   收集的信息仅用于改善学习体验、推荐合适内容，不会出售或共享给第三方。\n\n' +
                '3. 数据安全保障：\n' +
                '   我们采用行业标准加密技术保护您的数据安全，确保信息不被泄露。\n\n' +
                '4. 用户权利：\n' +
                '   您有权随时查看、修改或删除您的个人信息。\n\n' +
                '5. 隐私政策更新：\n' +
                '   如有重大变更，我们将通过应用内通知告知您。\n\n',
            buttons: [
                { text: '同意并关闭', color: '#2563EB' }
            ]
        });
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "myPage";
    }
}
registerNamedRoute(() => new myPage(undefined, {}), "", { bundleName: "com.example.educationapplication", moduleName: "entry", pagePath: "pages/myPage", pageFullPath: "entry/src/main/ets/pages/myPage", integratedHsp: "false", moduleType: "followWithHap" });

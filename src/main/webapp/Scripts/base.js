//分页控件
//PageString = new Page(page, data.count, 5, 12, "nextRecordPage").GetText();

var Page = function(CurrentPage, RecordCount, DisplayPages, PageSize, func, Url,openCode) {
    this.CurrentPage = parseInt(CurrentPage);
    this.RecordCount = RecordCount;
    this.First = "首页";
    this.Prev = "上一页";
    this.Next = "下一页";
    this.Last = "尾页";
    this.DisplayPages = DisplayPages;
    this._padLeft = null;
    this._padRight = null;
    this.PageSize = PageSize;
    this.PageCount = Math.ceil(this.RecordCount / this.PageSize);
    this.Url = Url;
    this.IsShowFirstAndLast = true;
    this.IsShowPageSearch = false;
    if(openCode){
        this.opencode = ",'',"+openCode;
    }else{
        this.opencode= "";
    }
    this.GetText = function() {
        if (this.PageCount == 0 || this.CurrentPage > this.PageCount) {
            
            return ""
        }
        var pageStr = "<span class='my_page_box'>";
        this.Padding();
        pageStr += this.RenderBeginTag();
        pageStr += this.RenderPagingContents();
        pageStr += this.RenderEndTag();
        pageStr = pageStr + "</span>";
        if(this.RecordCount > this.PageSize)
            return pageStr;
        else
            return "";
    };
    this.RenderBeginTag = function() {
        var str = "";
        var addition = "";
        if (this.CurrentPage > 1) {
            var temp = this.CurrentPage - 1 == 1 ? "1": (this.CurrentPage - 1);
            if (!this.Url) {
                if (this.IsShowFirstAndLast) {
                    str = "<a id=\"page_first\" title=\"首页\" class=\"direct btnPage\" href=\"javascript:void(0)\" onclick=\"" + func + "(1," + this.PageSize + this.opencode+");return false;\" >" + this.First + "</a>"
                }
                str += "<span class=\"PrePageSpan\" style=\"border:0px;padding:0px;\" ><a id=\"page_pre_" + temp + "\" href=\"javascript:void(0)\" title=\"上一页\" class=\"direct btnPage\" onclick=\"" + func + "(" + temp + "," + this.PageSize + this.opencode+");return false;\" >" + this.Prev + "</a></span>"
            }
        } else {
            str = "<a style='visibility:hidden' id=\"page_first\" title=\"首页\" class=\"direct btnPage\" href=\"javascript:void(0)\" onclick=\"" + func + "(1," + this.PageSize + this.opencode+");return false;\" >" + this.First + "</a>";
            str += "<span style='visibility:hidden' class=\"PrePageSpan\" style=\"border:0px;padding:0px;\" ><a id=\"page_pre_\" href=\"javascript:void(0)\" title=\"上一页\" class=\"direct btnPage\" return false;\" >" + this.Prev + "</a></span>"
        }
        return str
    };
    this.RenderEndTag = function() {
        var str = "";
        var addition = "";
        if (this.CurrentPage >= 1 && this.CurrentPage != this.RecordCount) {
            var temp = this.CurrentPage + 1;
            var temp1 = Math.ceil(this.RecordCount / this.PageSize);
            if (temp > temp1) {
                str = "";
                if (this.IsShowPageSearch) {
                    str += "<span class='page_search'>Pages：" + this.CurrentPage + "/" + this.PageCount + "&nbsp;<input type='textbox' id='inputSearch' class='input'><a href='javascript:void(0)' onclick='pageGo(this)'>Go</a></span>"
                }
                str = "<span style='visibility:hidden' class=\"NextPageSpan\" style=\"border:0px;padding:0px;\" ><a id=\"page_next_" + temp + "\" href=\"javascript:void(0)\"  title=\"下一页\" class=\"direct btnPage\" onclick=\"" + func + "(" + temp + "," + this.PageSize + this.opencode+");return false;\"  >" + this.Next + "</a></span>";
                str += "<a style='visibility:hidden' id=\"page_last_\" title=\"尾页\" href=\"javascript:void(0)\" class=\"direct btnPage\" >" + this.Last + "</a>"
            } else {
                if (!this.Url) {
                    str = "<span class=\"NextPageSpan\" style=\"border:0px;padding:0px;\" ><a id=\"page_next_" + temp + "\" href=\"javascript:void(0)\"  title=\"下一页\" class=\"direct btnPage\" onclick=\"" + func + "(" + temp + "," + this.PageSize + this.opencode+");return false;\"  >" + this.Next + "</a></span>";
                    if (this.IsShowFirstAndLast) {
                        str += "<a id=\"page_last_" + temp1 + "\" title=\"尾页\" href=\"javascript:void(0)\" class=\"direct btnPage\" onclick=\"" + func + "(" + temp1 + "," + this.PageSize + this.opencode+");return false;\" >" + this.Last + "</a>"
                    }
                }
            }
        } else {
            str = "<span style='visibility:hidden' class=\"NextPageSpan\" style=\"border:0px;padding:0px;\" ><a id=\"page_next_" + temp + "\" href=\"javascript:void(0)\"  title=\"下一页\" class=\"direct btnPage\" onclick=\"" + func + "(" + temp + "," + this.PageSize + this.opencode+");return false;\"  >" + this.Next + "</a></span>";
            str += "<a style='visibility:hidden' id=\"page_last_\" title=\"尾页\" href=\"javascript:void(0)\" class=\"direct btnPage\" >" + this.Last + "</a>"
        }
        return str
    };
    this.RenderPagingContents = function() {
        var str = "";
        if (this.PageCount <= this.DisplayPages) {
            str = str + this.RenderLinkRange(1, this.PageCount)
        } else {
            if (this.CurrentPage <= this._padRight) {
                str = str + this.RenderLinkRange(1, this.DisplayPages)
            } else if (CurrentPage <= (this.PageCount - this._padRight)) {
                str = str + this.RenderLinkRange((this.CurrentPage - this._padLeft), (this.CurrentPage + this._padRight))
            } else {
                str = str + this.RenderLinkRange((this.CurrentPage - (this.DisplayPages - ((this.PageCount - this.CurrentPage) + 1))), this.PageCount)
            }
        }
        return str
    };
    this.RenderLinkRange = function(start, end) {
        var str = "";
        var addition = "";
        for (i = start; i <= end; i++) {
            if (i == this.CurrentPage) {
                str = str + "<span id=\"page_" + i + "\" class=\"current\">" + i + "</span>"
            } else {
                var temp = (i == 1 ? 1 : i);
                if (this.Url) {
                    str = str + "<a id=\"page_" + temp + "\" href = \"" + this.Url + "_" + temp + addition + ".htm\" >" + i + "</a>"
                } else {
                    str = str + "<a id=\"page_" + temp + "\" href=\"javascript:void(0)\" onclick=\"" + func + "(" + temp + "," + this.PageSize + this.opencode+");return false;\" >" + i + "</a>"
                }
            }
        }
        return str
    };
    this.Padding = function() {
        this._padLeft = Math.floor(this.DisplayPages / 2);
        this._padRight = this._padLeft;
        if (this.DisplayPages % 2 == 0) this._padLeft--
    }
};

/**
 * @classDescription  弹出层构造函数
 * @type {Object}
 * @param {String | Object} 弹出层的id或者Dom对象 
 * @param {Object}  参数集合（包括modal, modalcolor, modalOpa, effect, pos, callback）
 */ 
function LightBox(boxId, option){
    this.setOption(option);
    var box = document.getElementById(boxId);
    var modalBox = document.getElementById("modal_layer");
    //var closeBtn = box.find(".close");
    
    var _this = this;

    if(!modalBox){
        modalBox = document.createElement("div");
        modalBox.id = "modal_layer";
        document.body.appendChild(modalBox);
    }

    modalBox.style.cssText = "display:none; position:absolute; left:0; top:0; z-index:100001; background-color:" + this.option.modalcolor;

    
    if(box){
        box.className += " css3-fadeInUp";
    }
    

    this.box = box;
    this.modalBox = modalBox;
};

LightBox.prototype.setOption = function(option){
    this.option = {
        modal:      true,       //是否打开黑幕层
        modalcolor: "#000",     //黑幕层颜色
        modalOpa:   20,         //黑幕层透明度
        pos:    "center",       //弹出层出现的位置
        effect: "normal",       //显示效果
        absolute: "",            //绝对定位，而非fixed
        zIndex:"100002",         //默认zIndex为100002
        callback:   null        //回调函数
    };

    $.extend(this.option, option || {}, true);
};

LightBox.prototype.open = function(){
    var height =  Math.max($(window).height(), $(document).height());
    var width = Math.max($(window).width(), $(document).width());
    var box = this.box;
    var modalBox = this.modalBox;
    
    if(this.option.modal){
        $(modalBox).css({height: height, width: width, opacity: 0.4, display: 'block'});
    }

    box.style.display = "block";
    box.className += " popWinTrue";
    box.style.zIndex = this.option.zIndex;
    box.style.position = "fixed";
    if(this.option.absolute == 1){
        box.style.position = "absolute";
    }
    switch(this.option.pos){
        case "center" :
            switch(this.option.effect){
                case "normal":
                    box.style.top = box.style.left = "50%";
                    box.style.marginTop = -(box.offsetHeight/2) + "px";
                    box.style.marginLeft = -(box.offsetWidth/2) + "px";
                    this.option.callback && this.option.callback(this);
                    break;
            }
            break;
    }
};

LightBox.prototype.close = function(){
    this.box.style.display = this.modalBox.style.display = "none";
    //执行回调
    this.option.onclose && this.option.onclose();
};

var SYS = {
    win : {//弹出窗口
        alert:function(string,callback,newButtonOption){//newButtonOption格式[{value:'按钮1'},{value:'按钮2'}...]
            if(typeof callback==='object'){
                newButtonOption=callback;
                callback=null;
            }
            var _this=this;
            //定义显示的按钮(value:''[,onclick:func,class:''])
            var btnArr=[{
                value:'确认',
                onclick:function(){
                    _this.winBox.close();
                    callback&&callback();
                    return false;
                }
            }];
            if(newButtonOption) btnArr = btnArr.concat(newButtonOption);
            this.createWin(string,btnArr);
            this.winBox.open();
        },
        confirm:function(string,callback,newButtonOption){
            if(typeof callback==='object'){
                newButtonOption=callback;
                callback=null;
            }
            var _this=this;       
            //定义显示的按钮(value:''[,onclick:func,class:''])
            var btnArr=[{
                value:'确认',
                onclick:function(){
                    _this.winBox.close();
                    callback&&callback();
                    return false;
                }
            }];
            var btnArrEnd=[{
                value:'取消',
                onclick:function(){
                    _this.winBox.close();
                    return false;
                    //callback&&callback();
                }
            }];
            if(newButtonOption){
                btnArr = btnArr.concat(newButtonOption).concat(btnArrEnd);
            }else{
                btnArr = btnArr.concat(btnArrEnd);
            }
            this.createWin(string,btnArr);
            this.winBox.open();
        },
        pop:function(string,className,newButtonOption){//用于完全自定义按钮区的弹窗，即不一定有确定，取消等一类的弹窗
            if(typeof className==='object'){
                newButtonOption = className;
                className = null;
            }else if(typeof className==='undefined'||typeof newButtonOption==='undefined'){
                var _this = this;
                newButtonOption = [{
                    value:'确认',
                    onclick:function(){
                        _this.winBox.close();
                        return false;
                    }
                }];
            }
            this.createWin(string,newButtonOption,className);
            this.winBox.open();
            return this.winBox;
        },
        autoClose:function(string,fn,timeout){//可自动关闭的小提示弹窗
            var $box=$('#fx_autoClose_tip');
            if(!$box.length){
                $('body').append('<div id="fx_autoClose_tip"></div>');
                $box=$('#fx_autoClose_tip');
            }
            $box.html(string);
            var posY=$(window).height()/2+$(window).scrollTop()-$box.height();
            var posX=($(window).width()-$box.width())/2;
            $box.css({left:posX,top:posY}).show();
            setTimeout(function(){$box.hide();fn&&fn()},timeout||1000);
        },
        processing:function(string){//用于显示进度信息，完全没有按钮区，且不能关闭和多了一个loading状态图
            var _this=this;
            var btnArr=[];
            this.createWin(string+'<br/><img style="margin-top:12px;" src="'+IMGHOST+'/fxstatic/images/fx_loading.gif"/>',btnArr);
            this.winBox.open();
            this.$win.find('.shut,.buttons').hide();
        },
        processingClose:function(){//用于关闭进度信息
            this.winBox.close();
            this.$win.find('.shut,.buttons').show();
        },
        init:function(id){//完全自定义html内容的窗口,并返回窗口对象
            var box = new LightBox(id, {modalOpa:40});
            $('#' + id).find('.shut,.confirm').click(function(){
                box.close();
                return false;
            });
            return box;
        },
        createWin:function(string,btnArr,className){
            var popId = 'fx_win',$pop = $('#'+popId);
            if(!$pop.length){
                $('body').append('<div id="'+popId+'" class="fxPopwin"><h3>提示</h3><a class="shut" href="javascript:;"></a><p></p><div class="buttons"></div></div>');
                $pop = $('#'+popId);
            }
            this.$win = $pop;
            this.winBox = new LightBox(popId, {
                modalOpa : 40,
                //callback : callback,
                onclose : function(){
                    if(className){
                        $pop.removeClass(className);
                    }
                }
            });
            //恢复默认样式
            $pop.attr('class', 'fxPopwin');
            if(className){
                $pop.addClass(className);
            }else{
                $pop.addClass('css3-fadeInUp');
            }
            $pop.find('p').html(string);
            this.initBtn(btnArr,$pop);
            //shut按钮init
            if(this.hasInitShut) return;
            this.hasInitShut=true;
            var _this=this;
            $pop.find('.shut').click(function(){
                _this.winBox.close();
                return false;//过滤IE默认的跳转
            });
        },
        initBtn:function(btnArr,$pop){
            var $box=$pop.find('.buttons');
            var s='',len=btnArr.length;
            for(var i=0;i<len;i++){
                var cls=btnArr[i]['class']||'';
                s+='<a class="confirm '+cls+'" href="###">'+btnArr[i]['value']+'</a>';
            }
            $box.html(s).find('a').each(function(i){
                $(this).click(btnArr[i].onclick);            
            });
        },
        close:function(){
            FX.win.winBox.close();
        },
        hasInitShut:false,
        winBox:null,
        $win:null
    },
    tab: function(tabId, clickCallback){
        var $tab = $(tabId);
        var $titleList = $tab.find('.title').children();
        var $contentList = $tab.find('.content').length > 1? $tab.find('.content'): $tab.find('.content').children();//支持content两种HTML结构
        $titleList.click(function(){
            clickCallback && clickCallback.call(this);
            $(this).addClass('cur').siblings().removeClass('cur');
            var index = $(this).index();
            $contentList.hide().eq(index).show();
        });
        
    },
    inputSelect: {
        init: function(cls){
            //input class
            cls = cls || '.inputSelect';
            //input event
            this.initInputEvent(cls);
            //add selectBox
            if(!$('#inputSelectBox').length){
                $('body').append('<div class="inputSelectBox" id="inputSelectBox"><p>选择（可多选）</p><ul class="clearfix"></ul><p class="center"><a href="javascript:;" class="input-button" onclick="WOW.inputSelect.select()">确定</a></p></div>');
                this.initSelectEvent();
            }
        },
        initInputEvent: function(cls){
            var _this = this;
            //input click
            $('body').on('click', cls, function(){  
                _this.renderPanel(this);
                _this.showPannel(this);
                _this.$input = $(this);
                return false;
            }).on('click', function(e){
                if(!$(e.target).closest('#inputSelectBox').length){
                    $('#inputSelectBox').hide();
                }
            });
        },
        initSelectEvent: function(){
            var _this = this;
            //select value
            $('body').on('click', '#inputSelectBox li', function(){
                if($(this).hasClass('checked')){
                    $(this).removeClass('checked'); 
                }else{
                    $(this).addClass('checked');
                }
            });
        },
        renderPanel: function(input){
            var valueArr = $(input).val().split(',');
            var valueListArr = $(input).attr('valueList').split(' ');
            var $ul = $('#inputSelectBox ul').html('');
            $.each(valueListArr, function(i, n){
                var cls = $.inArray(n, valueArr) == -1? '': 'checked';
                $ul.append('<li class="'+ cls +'">'+ n +'<i></i></li>')
            });
        },
        showPannel: function(input){
            var pos = $(input).offset();
            var h = $(input).height();
            $('#inputSelectBox').css({left: pos.left, top: pos.top + h - $(document).scrollTop()}).show();
        },
        select: function(){//确定选择
            var value = [];
            $('#inputSelectBox .checked').each(function(){
                value.push($(this).text());
            });
            this.$input && this.$input.val(value.join(','));
            $('#inputSelectBox').hide();
        },
        $input: null
    },
    form: {
        initData: function(json, fn){
            var obj = json;
            var key,value,tagName,type,arr;
            for(x in obj){
                key = x;
                value = obj[x];
                $("[name='"+key+"'],[name='"+key+"[]']").each(function(){
                    tagName = $(this)[0].tagName;
                    type = $(this).attr('type');
                    if(tagName=='INPUT'){
                        if(type=='radio'){
                            $(this).attr('checked',$(this).val()==value);
                        }else if(type=='checkbox'){
                            arr = value.split(',');
                            for(var i =0;i<arr.length;i++){
                                if($(this).val()==arr[i]){
                                    $(this).attr('checked',true);
                                    break;
                                }
                            }
                        }else{
                            $(this).val(value);
                        }
                    }else if(tagName=='SELECT' || tagName=='TEXTAREA'){
                        $(this).val(value);
                    }
                });
            }
            fn && fn();
        },
        sortInputName: function(inputParent){
            $(inputParent).find('input').each(function(i){
                var name = $(this).attr('name');
                name && $(this).attr('name', name.replace(/\[\d+\]/,'['+ i +']'));
            });
        },
        checkedAll: function(checkbox){
            var listId = $(checkbox).attr('checkList');
            if(listId){
                var $list = $('#' + listId);
                $(checkbox).change(function(){
                    if($(this).is(':checked')){
                        $list.find(':checkbox').attr('checked', true);
                    }else{
                        $list.find(':checkbox').attr('checked', false);
                    }
                });
            }
        },
        placeholder:function(){//可传入多个参数，类似({id:'test',left:100,top:200},..)，建议用下面form.placeholder
            var isSupport='placeholder' in document.createElement('input');
            if(isSupport) return;
            var args = arguments;
            $('input,textarea').each(function(){
                var text = $(this).attr('placeholder');
                var _this = this;
                if(text){
                    var posX=$(this).position().left;
                    var posY=$(this).position().top;
                    //自定义参数
                    if(args.length){
                        $.each(args,function(){
                            if(this.id == _this.id){
                                posX=this.left?this.left:posX;
                                posY=this.top?this.top:posY;
                            }
                        });
                    }
                    //var width=$(this).width();
                    var $e=$('<div class="fx-placeholder" style="display:none;color:#A9A9A9;font-size:14px; position:absolute; left:'+(posX+4)+'px; top:'+(posY+6)+'px;cursor:text;">'+text+'</div>');
                    $(_this).parent().append($e);
                    if(this.value==='') $e.show();
                    //事件
                    $(this).focus(function(){
                        $e.hide();     
                    }).blur(function(){
                        if(this.value==='') $e.show();
                    });
                    $e.click(function(){
                        $(_this).focus();
                    });
                }                             
            });
        }
    },
    upload: {
        //上传图片
        img: function(opt){
            opt = $.extend({
                btn: '',
                name: 'file',//action接收文件的name
                inputName: '',//隐藏input的name(自动添加)
                action: '',
                deleteAction: '',
                type: 'jpg|png|jpeg|gif',
                responseType: 'json',//服务器返回数据格式
                length: 0,//限制上传图片张数，0不限制
                select: function(file, ext){},//选择图片触发事件
                success: function(file, response){},//成功上传触发事件
                remove: function(){}//删除上传图片事件
            }, opt);
            var $btn = $(opt.btn);
            var $tips = $btn.next('.upload-tips');
            if(!window.AjaxUpload){
                return alert('请先引入js/ajaxupload.3.5.js文件');
            }
            new AjaxUpload($btn, {
                action: opt.action,
                name: opt.name,
                responseType: opt.responseType,
                onSubmit: function(file, ext){
                    if (! (ext && new RegExp('^('+ opt.type +')$').test(ext))){ 
                        WOW.win.alert('只允许上传'+ opt.type +'图片');
                        return false;
                    }
                    var len = $btn.parent().find('.upload-files').find('li').length;
                    if(opt.length && len >= opt.length){
                        WOW.win.alert('只允许上传'+ opt.length +'张图片，请删除图片再试');
                        return false;
                    }
                    $tips.text('Uploading...');
                    //
                    opt.select && opt.select(file, ext);
                },
                onComplete: function(file, response){
                    $tips.text('');
                    var $file = $btn.parent().find('.upload-files');
                    if(!$file.length){
                        $file = $btn.parent().append('<ul class="upload-files"></ul>').find('.upload-files');
                    }
                    if(response && response.code == 1){
                        $('<li></li>').appendTo($file).html('<img src="'+ response.data +'" alt="" /><i></i><input type="hidden" name="'+ opt.inputName +'" value="'+ response.data +'">').find('i').click(function(){
                            opt.deleteAction && $.getJSON(opt.deleteAction + '?imgUrl=' + response.data, function(json){
                                if(json.code == 1){
                                    $(this).parent().remove();
                                }else{
                                    alert(json);
                                }
                            });
                            opt.remove && opt.remove.call(this);//删除事件
                        });
                    } else{
                        WOW.win.alert(response.message);
                    }
                    //
                    opt.success && opt.success(file, response, $file);
                }
            });
        }
    }
};

/**
 * 前端模板类 v1.0
 * @data 2014/6/23
 */
;(function(){
  //Fxtpl命名空间
  var Fxtpl = {
    render : function(id, data, options){//渲染模板
      data = data || this.data;
      var elm = document.getElementById(id), fn, html;
      if(elm){
        if(id in this.cache){
          fn = this.cache[id];
        }else{
          fn = this.cache[id] = this.compile(elm.innerHTML, '', options);
        }
        try{
          html = fn(data);
        }catch(e){
          html = Fxtpl.error(e, '#'+ id, 'Render');
        }
        if(elm.nodeName.toUpperCase() !== 'SCRIPT'){
          html = html.replace(/<[^>]+>/g, function(a){
            return a.replace(/\btpl:/ig,'');//替换tpl虚构标签
          });
          elm.innerHTML = html;//TODO: 兼容IE某些tag不能innerHTML的情况
          elm.style.visibility = 'visible';
        }
        return html;
      }else{
        if(hasConsole && options && options.debug)
            console.warn('Fxtpl cannot find \''+ id +'\'');
      }
    },
    compile : function(str, data, options){//编译字符串
      var rep = this.__proto__?
        ["var s='';", "s+='", "';", "'+(", ")+'", "return s;"]:
        ["var s=[];", "s.push('", "');", "',", ",'", "return s.join('');"];
      var o = options || {};
      var _this = this;
      var _left = o.leftTag || this.config.leftTag;
      var _right = o.rightTag || this.config.rightTag;
      if(/</.test(_left)){
        var _l = _left.replace('<','&lt;');
        var _r = _right.replace('>','&gt;');
        str = str.split(_l).join(_left).split(_r).join(_right);
      }
      var escape = o.escape || this.config.escape;
      var varString = [];
      var fnBody = rep[0] + rep[1] +
        str
        .replace(/[\r\t\n]/g, "")
        .split(_left).join("\t")
        .split(_right).join("\r")
        .replace(/((^|\r)([^\t]*))/g, function(a,b,c,d){//html处理
          return c + d.replace(/('|\\)/g, '\\$1');
        })
        .replace(/(\t)(.*?)(\r)/g, function(a,b,c){//code处理
          return _this.parsing(c
            .replace(/&amp;/g,'&')
            .replace(/&lt;/g,'<')
            .replace(/&gt;/g,'>'), varString, rep, escape);
        }) +
        rep[2] + rep[5];
      fnBody = varString.join('') + fnBody;
      if(o.debug && hasConsole){
        console.log('Template HTML:' + str);
        console.log('Template Render:\nfunction(data){' + fnBody + '}');
      }
      try{
        var fn = new Function("data", fnBody);
        return data? fn(data): fn;
      }catch(e){
        var eMsg = Fxtpl.error(e, str, 'Compile');
        return function(){
          return eMsg;
        };
      }
    },
    parsing : function(code, varString, rep, escape){//编译语法
      var codeArr = code.replace(/^\s*|\s*$/g,'').replace(/\s{2,}/g,' ').split(' ');//处理多余空格后分组
      var varArr = /\$(\w+)/g.exec(code);
      if(varArr && !varString[varArr[1]]){//储存变量
        varString.push('var $',varArr[1],'=data.',varArr[1],';');
        varString[varArr[1]] = true;
      }
      switch(codeArr[0]){
        case 'if':
          return rep[2] + 'if('+ code.slice(3) +'){' + rep[1];
        case 'else':
          return rep[2] + '}else{' + rep[1];
        case 'elseif':
          return rep[2] + '}else if('+ code.slice(7) +'){' + rep[1];
        case '/if':
          return rep[2] + '}' + rep[1];
        case 'each':
          var e_o = codeArr[1];
          var e_p = codeArr[3] || '$item';
          var e_i = (codeArr[2] === 'as'? codeArr[4]: codeArr[2]) || '$index';
          return rep[2] + 'Fxtpl.each('+ e_o +',function('+ e_p +','+ e_i +'){' + rep[1];
        case '/each':
          return rep[2] + '});' + rep[1];
        case 'loop':
          var l_len = codeArr[1];
          var l_idx = codeArr[2] === 'as'? codeArr[3] : '$index';
          return rep[2] + 'Fxtpl.loop('+ l_len +',function('+ l_idx +'){' + rep[1];
        case '/loop':
          return rep[2] + '});' + rep[1];
        case 'include':
          return rep[3] + 'Fxtpl.render('+ codeArr.slice(1).join('') +')' + rep[4];
        default://输出变量
          if(/[^|]\|[^|]/.test(code)){//helpers
            code = Fxtpl.filter(code);
          }
          return rep[3] + (escape?'Fxtpl.escape(String('+ code +'))' : code) + rep[4];
      }
    },
    filter: function(code){
      var arr = code.split('|');
      var str = arr[0];
      var len = arr.length;
      for(var i = 1; i < len; i++){
        var fnArr = arr[i].replace(/^\s+/, '').split(' ');
        var fnName = fnArr.shift();
        var args = fnArr.join(' ');
        args = args? ', ' + args : args;
        str = 'Fxtpl.helpers.' + fnName + '(' + str + args + ')';
      }
      return str;
    },
    escape : function(str){//HTML转义
      return str
          .replace(/&/g,'&amp;')
          .replace(/</g,'&lt;')
          .replace(/>/g,'&gt;')
          .replace(/"/g,'&quot;')
          .replace(/'/g,'&#39;');
    },
    each : function(data, callback){//遍历对象
      if (({}).toString.call(data) === '[object Array]') {
          for (var i = 0, len = data.length; i < len; i++) {
              callback.call(data[i], data[i], i);
          }
      } else {
          for (var p in data) {
              callback.call(data[p], data[p], p);
          }
      }
    },
    loop: function(exp, callback) {
        var loop = !isNaN(parseInt(exp)) ? parseInt(exp) : 0;
        for(var i = 0; i < loop; i++) {
            callback.call(this, i);
        }
    },
    helpers: {
      escape: function(str){
        return Fxtpl.escape(String(str));
      }
    },
    error: function(e, id, type){
      var pos = id.length > 100? id.slice(0, 100)+ '...': id;
      var eMsg = 'Fxtpl '+ type +' Error: ' + e.message + ' in \'' + pos +'\'';
      hasConsole && console.error(eMsg);
      return eMsg;
    },
    cache : {},//模板函数缓存
    data : {},//模板全局数据缓存
    config: {//模板全局配置
      leftTag : '<!--[',//语法左分隔符
      rightTag : ']-->',//语法左右隔符
      escape : false//模板输出的变量是否HTML转义
    }
  };
  //浏览器调式判断
  var hasConsole = !!window.console;
  //输出全局变量
  window.Fxtpl = Fxtpl;
})();

//
$(function(){
    SYS.form.placeholder();
});
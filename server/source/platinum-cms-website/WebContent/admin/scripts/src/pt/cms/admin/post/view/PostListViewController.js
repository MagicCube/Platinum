$ns("pt.cms.admin.post.view");

$import("mx.view.ListViewController");

$include("$/pt/cms/admin/post/view/PostListView.css");

pt.cms.admin.post.view.PostListViewController = function()
{
    var me = $extend(mx.view.ListViewController);
    var base = {};
    
    me.toolbar = null;
    
    me.restClient = null;
    
    me.$searchBar = null;
    
    var _$keywords = null;
    var _renderMode = "text";
       
    base.viewDidLoad = me.viewDidLoad;
    me.viewDidLoad = function()
    {
        me.view.$element.addClass("PostListView");
        
        me.view.rowHeight = 78;
        base.viewDidLoad();
        
        me.toolbar = new pt.cms.admin.common.view.Toolbar({ id: "postListToolbar" });
        _$keywords = $("<input type='text' id='keywords'>");
        _$keywords.hint({ text: "输入搜索关键字或内容的 ID" });
        _$keywords.on("keydown", _keywords_onkeydown);
        me.$searchBar = $("<div id='searchBar'>");
        me.$searchBar.append(_$keywords);
        
        me.toolbar.$element.append(me.$searchBar);
        
        me.toolbar.addButton("newPost", "新建").addClass("default").click(_btnNewPost_onclick);
        me.toolbar.addButton("deletePost", "删除").addClass("red").click(_btnDeletePost_onclick);
    };
    
    
    me.loadData = function()
    {
        me.queryByCategory(null);
    };
    
    
    me.queryByKeywords = function(p_keywords)
    {
        _renderMode = "html";
        me.restClient.GET("admin/post/", { keywords: p_keywords })
            .success(function(p_result){
                me.setData(p_result);
            });
    };
    
    me.queryByCategory = function(p_categoryId)
    {
        _renderMode = "text";
        me.restClient.GET("admin/post/")
            .success(function(p_result){
                me.setData(p_result);
            });
    };
    
    
    
    
    base.createBlankRow = me.createBlankRow;
    me.createBlankRow = function(p_index)
    {
        var $row = base.createBlankRow(p_index);
        $row.append("<div id='updateTime'/> <div id='source'/> <div id='summary'/>");
        return $row;
    };
    
    base.renderRow = me.renderRow;
    me.renderRow = function($p_row, p_item)
    {
        base.renderRow($p_row, p_item);
        
        var updateTime = new Date(p_item.updateTime);
        $p_row.children("#updateTime").text($format(updateTime, "smart"));
        $p_row.children("#updateTime").attr("title", $format(updateTime, "yyyy年M日d日 HH:mm:ss"));
        $p_row.children("#source").text(p_item.source);
        
        
        
        if (_renderMode == "html")
        {
            $p_row.children("#title").html(p_item.title);
            $p_row.children("#summary").html(p_item.summary);
        }
        else
        {
            $p_row.children("#title").html(p_item.title);
            $p_row.children("#summary").text(p_item.summary);
        }
        $p_row.children("#title").attr("title", $p_row.children("#title").text());
    };
    
    
    me.newPost=  function()
    {
        $pageController.rootViewController.editPost({
            id: null,
            title: "标题",
            postStatus: 0,
            summary: "在这里添加摘要（120字以内）",
            contentText: "在这里添加正文"
        });
    };
    
    me.deleteSelectedPost = function()
    {
        if (me.view.selectedIndex < 0) return;
        
        var post = me.data[me.view.selectedIndex];
        if (post != null)
        {
            if (confirm("确实要删除“" + post.title + "”吗？"))
            {
                me.restClient.DELETE("admin/post/" + post.id, null)
                    .success(function(){
                        
                    });
            }
        }
    };
    
    
    function _btnNewPost_onclick(e)
    {
        me.newPost();
    }
    
    function _btnDeletePost_onclick(e)
    {
        me.deleteSelectedPost();
    }
    
    function _keywords_onkeydown(e)
    {
        if (e.keyCode == 13)
        {
            var keywords = _$keywords.val();
            if (keywords.trim() == "")
            {
                me.queryByCategory(null);
            }
            else
            {
                me.queryByKeywords(keywords);
            }
        }
    }
    
    return me.endOfClass(arguments);
};
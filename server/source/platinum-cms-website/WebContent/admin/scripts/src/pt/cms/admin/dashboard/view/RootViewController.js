$ns("pt.cms.admin.dashboard.view");
$import("mx.view.ListViewController");

pt.cms.admin.dashboard.view.RootViewController = function()
{
	   var me = $extend(mx.view.ViewController);
    var base = {};
    me.toolbar = null;
    me.toolbars = [];
    me.postListViewController = null;
    me.postDetailViewController = null;
    me.postEditViewController = null;
    
    me.baseUrl = "/api/0/";
    me.categories = null;
    me.category=null;
    me.p_keywords="hitcount";
    
    
  
    var p_data=null;
    me.GET = function(p_path, p_data)
    {
        var url = me.baseUrl + p_path;
        var result = $.ajax({
            type: "GET",
            url: url,
            data: p_data,
        });
       
        
        return result;
    };
    
    
    
    me.GET("admin/post", null).success(function(p_result){
    	
       
    
    	 me.categories = p_result;
     	 var $div =$( "<ul class='Panel' > <h1>自己发布的时间最近的内容</h1> </ul>");
     	  for (var i = 0; i < p_result.length; i++) 
     		
     	    
     	  { me.category=me.categories[i];
     	  
     	  
     	  var $a=$("<li  class=aaa ></li>");
   	     $a.attr("id", me.category.id);
   	  
   	  
   	     $a.text(me.category.title);
   	     $div.append($a);
   	     
                   
     		me.view.$container.append($div);
     	  }
     	  
    
     	  
     	 $("ul li ").each(function(){
     		
     		
  		   $(this).click(function(){
  			   
  			   
  			   
  			   var lis_value = $(this).attr("id");  
                
  			
  			 
  			 
  			   base.viewDidLoad();
  		 
  		       
  	     
  		   
  		        
  		        me.postDetailViewController = new pt.cms.admin.post.view.PostDetailViewController({
  		            restClient: me.restClient,
  		            view: {
  		                frame: { left: 0, right: 0, top: 0, bottom: 0}
  		            }
  		        });
  		        me.postDetailViewController.loadData(lis_value);
  		        
  		      
  		        me.view.addSubview(me.postDetailViewController.view);

  		     
  		    
  	      
  		        
  		        _initToolbars();
  		      for (var i = 0; i < me.toolbars.length; i++)
              {
                  var toolbarr = me.toolbars[i];
                  
                  $("#toolstrip").append(toolbarr.$element);
              
               
                
              }
  	      
  	         
  		 
  		      
      		  
      		   
      		
  			   
  			   
  		   });
  		});
    	
    	    	
    });
    
    me.GET("admin/post",{dashboardhitcount: me.p_keywords}).success(function(p_result){
    	
        

   	 me.categories = p_result;
    	 var $div =$( "<ul class='Panel' > <h1>点击次数最多的内容</h1> </ul>");
    	  for (var i = 0; i < p_result.length; i++) 
    		
    	    
    	  { me.category=me.categories[i];
    	  
    	  
    	  var $a=$("<li  class=aaa ></li>");
  	     $a.attr("id", me.category.id);
  	  
  	  
  	     $a.text(me.category.title);
  	     $div.append($a);
  	     
                  
    		me.view.$container.append($div);
    	  }
    		
        	$("ul li ").each(function(){
        		
        		
        		   $(this).click(function(){
        			   
        			   
        			   
        			   var lis_value = $(this).attr("id");  
                      
        		        base.viewDidLoad();
        		 
        		 
        	     
        		   
        		        
        		        me.postDetailViewController = new pt.cms.admin.post.view.PostDetailViewController({
        		            restClient: me.restClient,
        		            view: {
        		                frame: { left: 0, right: 0, top: 0, bottom: 0}
        		            }
        		        });
        		        me.postDetailViewController.loadData(lis_value);
        		        
        		      
        		        me.view.addSubview(me.postDetailViewController.view);

        		     
        		    
        	      
        		        
        		        _initToolbars();
        		      for (var i = 0; i < me.toolbars.length; i++)
                    {
                        var toolbarr = me.toolbars[i];
                        
                        $("#toolstrip").append(toolbarr.$element);
                    
                     
                      
                    }
        	      
        	         
        		 
        		      
            		  
            		   
            		
        			   
        			   
        		   });
        		});
   	
   	
   
   	    	
   });
    
    
    
    me.GET("admin/post",{dashboardtime: me.p_keywords}).success(function(p_result){
    	
    	
      	 me.categories = p_result;
       	 var $div =$( "<ul class='Panel' > <h1>时间最近的内容</h1> </ul>");
       	  for (var i = 0; i < p_result.length; i++) 
       		
       	    
       	  { me.category=me.categories[i];
       	  
       	  
       	  var $a=$("<li  class=aaa ></li>");
     	     $a.attr("id", me.category.id);
     	  
     	  
     	     $a.text(me.category.title);
     	     $div.append($a);
     	     
                     
       		me.view.$container.append($div);
       	  }
       	  
      	
      	$("ul li ").each(function(){
      		
      		
      		   $(this).click(function(){
      			   
      			   
      			   
      			   var lis_value = $(this).attr("id");  
                    
      		        base.viewDidLoad();
      		 
      		 
      	     
      		   
      		        
      		        me.postDetailViewController = new pt.cms.admin.post.view.PostDetailViewController({
      		            restClient: me.restClient,
      		            view: {
      		                frame: { left: 0, right: 0, top: 0, bottom: 0}
      		            }
      		        });
      		        me.postDetailViewController.loadData(lis_value);
      		        
      		      
      		        me.view.addSubview(me.postDetailViewController.view);

      		     
      		    
      	      
      		        
      		        _initToolbars();
      		      for (var i = 0; i < me.toolbars.length; i++)
                  {
                      var toolbarr = me.toolbars[i];
                      
                      $("#toolstrip").append(toolbarr.$element);
                  
                   
                    
                  }
      	      
      	         
      		 
      		      
          		  
          		   
          		
      			   
      			   
      		   });
      		});
        
      
      	    	
      });
    
    me.editPost = function(p_post)
    {
        if (me.postEditViewController == null)
        {
            me.postEditViewController = new pt.cms.admin.post.view.PostEditViewController({ restClient: me.restClient });
        }
        $pageController.pushViewController(me.postEditViewController);
        me.postEditViewController.setData(p_post);
    };
    
    function _initToolbars()
    {
       
        
        me.postDetailViewController.toolbar.setFrame({ left: me.postDetailViewController.view.frame.left, top: 0, right: me.postDetailViewController.view.frame.right });
        me.toolbars.add(me.postDetailViewController.toolbar);
    }
    
    
    function _postListView_onselectionchanged(e)
    {
        var post = me.postListViewController.data[me.postListViewController.view.selectedIndex];
        
        me.postDetailViewController.loadData(post.id);
    }
    
   
    
    base.viewDidLoad = me.viewDidLoad;
    me.viewDidLoad = function()
    {
        base.viewDidLoad();
        
     
        me.view.$container.css("paddingLeft", 25);
    };
                                                             
    return me.endOfClass(arguments);
};
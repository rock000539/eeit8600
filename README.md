#EEIT86 

#2016/06/15 - 2016/06/22

1. BootStrap 調整樣式 (bms) 
   -> Header, Footer (切割出來(要包含import css, js檔)) (Kate)
   (可參考docs/bootstrap.txt)

2. @ManyToMany 如何長出副表？(測試即可) (CH)

3. @OneToMany @ManyToOne @ForeignKey 
   (欄位上應該要加上哪一種Annotation？) (Parker)

4. FileUpload、FileReader 
   (Upload到後台並將路徑寫到資料庫、Servlet讀圖片顯示在畫面上(測試即可)) (Charis)

5. jQueryGrid 連結Add / Edit 頁面、分頁 (CH)

6. 認養表格：(CRUD+3個頁面)
		     日期 (Parker)
		     成分 (Kate)
	 	     產品 (CH)
		     心得 (Hsiang)
	 	     文章 (Charis)
		     會員 (Kate)
	 	     品牌 (Charis)
		     分類 (Hsiang)
	 	     心得留言表 (Hsiang)
		     文章留言表 (Hsiang)
		     
#2016/06/23 - 2016/06/29

1. 決定Client端網頁樣式  BootStrap -> Header, Footer

2. 前台頁面

	(1)首頁 (基本做完 -> 規劃頁面, 可連結各個畫面, 不一定要有資料)

	(2)查詢製造日期頁面or首頁側邊框 (Dialog Show出結果即可)

	(3)產品頁面 (Select列表在畫面)
   
	(4)加入會員頁面 (成功insert到資料庫並轉回首頁)

	(5)會員登入頁面 (Session記得使用者資料)
	
	(6)心得列表頁面, 寫心得存入資料庫 (先不用照時間排序)

3. 查詢各廠牌的計算公式 (如何撰寫？)

4. 長出 心得/文章 /慾望收藏 3個副表

5. 研究Server端利用@Annotation驗證資料

6. 複合查詢 Specification

#2016/06/30 - 2016/07/03 緩衝期
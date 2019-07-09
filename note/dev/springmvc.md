## ContextLoaderListener

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190704095712.png)

```java
	@Override
	public void contextInitialized(ServletContextEvent event) {
		initWebApplicationContext(event.getServletContext());
	}


	/**
	 * Close the root web application context.
	 */
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		closeWebApplicationContext(event.getServletContext());
		ContextCleanupListener.cleanupAttributes(event.getServletContext());
	}

```

初始化 initWebApplicationContext

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190704103744.png)

1: spring web 容器还没有初始化, 就创建一个全新的spring web 容器
2: 配置并刷新容器

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190704110544.png)

![](https://riverluooo.oss-cn-beijing.aliyuncs.com/img/20190704110600.png)







# Flow-recreate-ios-project

主要用来再次初始化 用户的io project 项目，以便完成flow.ci 的 集成

## 依赖
依赖ruby环境
- ruby version >= 2.0 
- gem xcodeproj    (gem install xcodeproj 即可)

## 使用

`./run.rb IOS_PROJECT_PATH_NAME 

或者在脚本中 
`gem install xcodeproj && (curl -s https://raw.githubusercontent.com/flow-ci-plugin/flow-recreate-ios-project/master/run.rb > run.rb) && ruby run.rb $FLOW_IOS_PROJECT_PATH_NAME`

其中 FLOW_IOS_PROJECT_PATH_NAME 为 `.xcodeproj` 的相对uri     

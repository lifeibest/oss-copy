#!/bin/bash

# ---配置开始
# 修改下面各配置变量
# oss配置，accessKeyID在OSS管理后台设置好读写权限
endpoint="xxx.aliyuncs.com"
accessKeyID="xxx"
accessKeySecret="xxx"
bucketName="xxx"

# ossutilconfigFile存储配置的文件
ossutilconfigFile="/tmp/.ossutilconfig"
#localDir 本地需要同步的文件目录
localDir="xxx"
#d stDir 如果目录没有，会自动创建，测试的时候尽量新建一个目录，避免同步的时候文件被覆盖
dstDir="xxx"
# ossutilCmd ossutil命令行位置，比如"/usr/bin/ossutil"
ossutilCmd="/usr/bin/ossutil"
# ---配置结束


# 运行，同步文件
$ossutilCmd config -e $endpoint -i $accessKeyID -k $accessKeySecret  -L CH -c $ossutilconfigFile
# 参数说明
# cp 将您的本地文件或文件夹上传至OSS https://help.aliyun.com/document_detail/179388.htm
# -u 只有当目标文件不存在，或源文件的最后修改时间晚于目标文件时，ossutil才会执行上传操作。
# --exclude 不包含任何符合指定条件的文件。
$ossutilCmd -c $ossutilconfigFile cp -r $localDir  oss://$bucketName/$dstDir -f -u  --exclude "oss-copy.sh" --exclude "*.git" --exclude ".DS_Store" --exclude ".ossutil_checkpoint"  --exclude "ossutil_output"
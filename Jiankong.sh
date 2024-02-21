#!/bin/bash

echo "请选择要查询的服务："
echo "1. Babylon"
echo "2. Artela"
echo "3. Zora"
echo "4. Taiko"
echo "5. Avail X Karnot"
echo "6. Nulink"
echo "7.Avail-light"
echo "8.Dusk"
echo "9. 创建jiankong命令"

read -p "请输入选项（1-9）：" option

case $option in
  1)
    systemctl status babylon
    ;;
  2)
    systemctl status artelad
    ;;
  3)
    docker ps
    ;;
  4)
    #!/bin/bash

# 检查 jq 是否已安装
if ! command -v jq &> /dev/null
then
    echo "jq 未安装，正在尝试安装..."
    # 根据你的系统选择合适的安装命令
    # Ubuntu/Debian 系统:
    sudo apt-get update && sudo apt-get install jq
    # 如果你使用的是RedHat/CentOS，可能需要使用 yum:
    # sudo yum install jq
    # 对于Fedora:
    # sudo dnf install jq
fi

# 执行 curl 命令并处理结果
result=$(curl http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}' | jq -r '.result')

# 将十六进制的结果转换为十进制
if [ -n "$result" ]; then
    echo $((16#$result))
else
    echo "未能获取区块号"
fi

    ;;
  5)
    echo "请使用其他设备访问本机公网IP:4000端口"
    ;;
  6)
    docker logs -f ursula
    ;;
  7)
    systemctl status availd
    ;;
  8)
    grep "block accepted" /var/log/rusk.log  
    ;;
  9)
    SCRIPT_PATH="$(realpath $0)"
    echo "alias jiankong='$SCRIPT_PATH'" >> ~/.bashrc
    source ~/.bashrc
    echo "jiankong命令已创建，请手动运行source ~/.bashrc ，后续使用jiankong即可启动脚本。"
    ;;
  *)
    echo "无效选项，请输入1-9之间的数字。"
    ;;
esac

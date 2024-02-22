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
    systemctl status babylond
    ;;
  2)
    systemctl status artelad
    ;;
  3)
    docker ps
    ;;
  4)
    response=$(curl -s http://localhost:8547 \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"method":"eth_blockNumber","params":[],"id":1,"jsonrpc":"2.0"}')

# 从响应中提取区块高度的十六进制值
hex_block_number=$(echo $response | jq -r '.result' | sed 's/0x//')

# 将十六进制值转换为十进制
dec_block_number=$((16#$hex_block_number))

# 输出当前区块高度
echo "当前区块高度: $dec_block_number"
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

apt update
apt install -y autoconf automake autotools-dev curl libmpc-dev \
               libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
               gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

mkdir /opt/riscv32i
chown $USER /opt/riscv32i

git config --global url.https://github.com/.insteadOf git://github.com/

git clone https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain-rv32i
cd riscv-gnu-toolchain-rv32i
git checkout 411d134
git submodule update --init --recursive

mkdir build; cd build
../configure --with-arch=rv32i --prefix=/opt/riscv32i
make -j$(nproc)

cd /opt/ && tar -cvf riscv32i.tar.gz riscv32i

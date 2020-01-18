pkgname=governor-switcher
pkgver=1.01
pkgrel=1
pkgdesc="toggle between ondemand and performance based on time of day"
arch=(any)
url="https://github.com/graysky2/governor-switcher"
license=('MIT')
depends=(systemd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/governor-switcher/archive/v$pkgver.tar.gz")
sha256sums=('feb4c488332bb1ebf71ccc5f184d86aa0c79bafaad80194af6439a35eb201e54')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Linux-Bash-Project

## Tanıtım
Bu kodun amacı bilgisayarda görünmez bir klasör yani kasa oluşturmak ve linux'da zaten var olan gpg ile arayüz aracılığı yardımıyla şifrelemek ve şifrelenen dosyaları bu görünmez klasöre taşımak aynı zamanda şifrelenen dosyanın ismini girerek şifreli dosyanın şifresini kaldırıp görünmez (gizli) klasörden çıkarmaktır. Bir nevi kendi kişisel güvenli kasanızı oluşturmak.

## Nasıl Çalışıyor
Bu kod parçası gerekli kasayı kendi çalışma dizininde oluşturmaktadır aynı zamanda şifreleyeceğiniz dosyalarda kasanın ve kodun bulunduğu dizinde olmalıdır. Sudo şifresi sayesinde chmod ile kullanıcının klasör üstündeki yetkisi program sonlandırılmadan önce 000 ile tamamen kaldırılıyor script çalıştırıldığı zaman ve sudo şifresi doğru girildiği zaman 700 kodu ile kullanıcıya bütün yetkiler geri veriliyor. Bu şekilde yaparak klasörün script dışında erişilmesini engelliyorum. 
<br />
<br />
Eğer dosya ismi doğru girilmişse gpg paketi ile dosya simetrik olarak şifreleniyor ve aynı zamanda koyulan şifre kaldırılabiliniyor. Dosya şifrelenince şifrelenen dosya kasaya taşınmaktadır ve orjinal hali silinmektedir. Şifre kaldırılırken de bu işlemin tam tersi yapılmaktadır. 
<br />
<br />
<b>Dosyayı çalıştırmak için yapılması gerekenler</b>
<br />
<br />
* Terminal üzerinden kodun bulunduğu dizine git 
*Aşağıdaki kodu yazarak programı çalıştır

```bash
bash SuperSafeErdalNayir.sh
````

#!/bin/bash

TEXTTOSHOW="Süper kasaya hoş geldiniz. Bu uygulamada dosyalarınızı ziplerinizi şifreleyebilir ve görünmez kasamızda saklayabilirsiniz. Dosyalarınız kimse tarafından erişilmez olur "

whiptail --title "Süper Kasaya hoşgeldiniz" --msgbox "$TEXTTOSHOW" 10 80

isContinue=1
isExistFolder=0

#Sudo password check
SudoCheck () {
   if echo $1 | sudo  -S true 2>/dev/null;
   then
      return 1
   else
      return 0
   fi
}

#Gorunmez kasa olusturma islemi

NAMEOFSAFE=".TheSafestSafe"

PASS=$(whiptail --title "Admin sifresi" --passwordbox "Lütfen sudo şifrenizi giriniz(Kasa erişimi için)" 10 80 3>&1 1>&2 2>&3)

LENOFPASS=`expr length "$PASS"`

if [ $LENOFPASS == 0 ]

then

   isContinue=0
   whiptail --title "İslem sonlandiriliyor" --msgbox "İşlemi iptal ettiğiniz ya da geçersiz uzunlukta şifre girdiğiniz için işleme devam edilemiyor.." 10 80

elif [ $LENOFPASS -gt 0 ]

then
   SudoCheck $PASS #function invoke
   ret=$? #last returned value

   NUMBEROFSAFE=`ls -al | grep -c .TheSafestSafe`


   if [ $NUMBEROFSAFE == 0 ]
   then

      if [ $ret == 1 ]

      then

         whiptail --title "Kasa oluşturma" --msgbox "Görünüşe göre görünmez kasanız bulunmamaktadır. Sizin için sadece bir seferliğe mahsus kasanız oluşturulacaktır" 10 80

         #Gorunmez kasa olusturma islemi
         `mkdir $NAMEOFSAFE`

         echo -e $PASS | sudo -S chmod 700 $NAMEOFSAFE

         whiptail --title "İslem Başarili" --msgbox "Görünmez kasanız oluşturuldu" 10 40
         isExistFolder=1
      else
         whiptail --title "Yanlış şifre" --msgbox "Yanlış sudo şifresi girdiniz. Program kapatılıyor" 10 80
         isContinue=0
      fi
   else
      if [ $ret == 1 ]
      then
         echo -e $PASS | sudo -S chmod 700 $NAMEOFSAFE
         isExistFolder=1
      else
	 isExistFolder=1
         isContinue=0
      fi
   fi
fi

#SudoCheck fonksiyonu bir kez daha calistiriliyor
SudoCheck $PASS
ret=$? #en son döndürülen deger

if [ $ret == 0 -a $isExistFolder == 1 ]
then
   whiptail --title "Yanlış şifre 2" --msgbox "Yanlış sudo şifresi girdiniz. Program kapatılıyor" 10 80
   isContinue=0
fi

while [ $isContinue == 1 ]
do

 CHOICE=$(whiptail --title "Ana Menü"  --menu "Lütfen yapmak istediğiniz işlemi seçiniz" 18 60 10 \
 "1" "Dosya Şifrele" \ "2" "Şifreli Dosyayı Oku" \ "q" "Çıkış"  3>&1 1>&2 2>&3)

 if [ -z "$CHOICE" ]
 then
    echo -e $PASS | sudo -S chmod 000 $NAMEOFSAFE 
    whiptail --title "Hoşçakalın" --msgbox "Görüşmek üzere :))" 10 50
    break
 else
    if [ $CHOICE == "q" ]
    then
       echo -e $PASS | sudo -S chmod 000 $NAMEOFSAFE 
       whiptail --title "Hoşçakalın" --msgbox "Görüşmek üzere :))" 10 50
       break
    elif [ $CHOICE == "1" ]
    then
       FILE_NAME=$(whiptail --title "Dosya adi "  --inputbox "Lütfen şifrelemek istediğiniz dosyanın ismini giriniz (Gireceğiniz dosya kodun çalıştığı dizinde olmalı" 10 100 3>&1 1>&2 2>&3)
       NUMBEROFFILE=`ls | grep -c $FILE_NAME`

       if [ $NUMBEROFFILE == 1 ]
       then
          FULLFILENAME=`ls | grep $FILE_NAME`
	  `gpg -c $FULLFILENAME`
	  `rm $FULLFILENAME`

	  SAFEDIR="$NAMEOFSAFE"/

	  ENCRYPTED_FILE="$FULLFILENAME".gpg

          mv $ENCRYPTED_FILE $SAFEDIR

          whiptail --title "Başarılı" --msgbox "Dosya şifreleme başarılı" 10 50

       else
          whiptail --title "Hata" --msgbox "Girdiğiniz dosya ismi eksik veya yanlış ya da dosya bulunmamaktadır" 10 50
       fi

    elif [ $CHOICE == "2" ]
    then
       FILE_NAME=$(whiptail --title "Dosya adi "  --inputbox "Lütfen şifresini kırmak istediğiniz dosyanın adını giriniz" 10 100 3>&1 1>&2 2>&3)

       NUMOFFILE=$(cd .TheSafestSafe/ && ls | grep -c $FILE_NAME)

       if [ $NUMOFFILE == 1 ]
       then
	  currDir=`pwd`
          FILE=$(cd .TheSafestSafe/ && ls | grep $FILE_NAME)
	  FILENAME=${FILE%.*}

          (cd .TheSafestSafe/ && gpg -o $FILENAME -d $FILE)

	  (cd .TheSafestSafe/ && rm $FILE)

	  (cd .TheSafestSafe/ && mv $FILENAME $currDir) 

          whiptail --title "Başarılı" --msgbox "$Dosya şifresi kırıldı" 10 50
       else
          whiptail --title "İşlem Başarısız" --msgbox "Şİfresini kırmak istediğiniz dosya bulunamadı (Geçerli isim giriniz)" 10 50
       fi
    fi
 fi

done


#(cd .TheSafestSafe && pwd)




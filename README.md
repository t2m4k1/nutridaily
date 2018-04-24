# README
Install Rails for Windows  
Install Postgresql  
Create a database in postgresql (either with the psql console or pgadmin)  
Create a new user (e.g. nutridailyadmin)  
Make the new user the owner of the new database    
Create and fill config/database.yml according to the database user and the database name.  

Windows-Installation  
Install: http://railsinstaller.org/en
Rails-Version: 5.1.6  --> included  
Ruby-Version: 2.3.3  --> included  

Additionally install  
Postgresql: 10.3  
Install NodeJS  
Install ImageMagick (check Install legacy utilities (e.g. convert) during installation:  
https://www.imagemagick.org/download/binaries/ImageMagick-7.0.7-28-Q16-x64-dll.exe  

Read about rails associations types (including polymorphic has many)  
Look through data-model (link)  
Look through models folder and check files  
Look through db/migrate folder and check files  

Rails Book, free to read:  
https://www.railstutorial.org/book  

Interesting cast about nested forms:  
http://railscasts.com/episodes/196-nested-model-form-part-1?autoplay=true  

Quickstart:  
open rails console  
cd to project folder  
type: "rails s"  

open second rails console  
cd to project folder  
type: "rails c"  
type: User  
==> Rails lists the models fields   
to create a User in the database type:  
User.create!(name: 'ABC', email: 'BLABLA', password: 'AA')  


Helpful links:  

Ruby On Rails:  
https://www.youtube.com/watch?v=OHgXELONyTQ  
http://guides.rubyonrails.org/association\_basics.html  
https://www.youtube.com/watch?v=pPy0GQJLZUM  
http://cobwwweb.com/rails-has-many-through-polymorphic-association  


CSS:  
https://www.youtube.com/watch?v=0afZj1G0BIE  


To be discussed:  
https://revs.runtime-revolution.com/saving-multiple-models-with-form-objects-and-transactions-2c26f37f7b9a


Link to data-model:  
https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Untitled%20Diagram.xml#R7V1fk6M2Ev80U5V78BRCSMDjzuxuslW5qlT2%2FuSeXBhkmwxGBPDs%2BD79SQbZRggbbIFhbh6SHQtktdTd6l%2B3uuUH%2BLx5%2Bzn1kvXfaUCiB9MI3h7g5wfTtAE02D%2B8ZVe0WMiyi5ZVGgZFGzg2fA%2F%2FS8rGsuNqGwYkq7yYUxrlYVJt9GkcEz%2BvtHlpSn9UX1vSqDpq4q1IreG770X11n%2BHQb4uWwF2jw9%2BIeFqXQ7tmOX8Np54uZxJtvYC%2BuOkCX55gM8ppXnx1%2BbtmUR89cS6FP2%2BNjw9EJaSOG%2FTwURFj1cv2paTezBxxPo%2BJZy8fFfOGf%2B15TQ9bbx0FcYP8BN7aiRv7P%2BscT8z3j7LaVI8s06e5eQtn3lRuCr7%2BYw4klYfB8SnqZeHtHxnGwckjcKYHIdmf63Kf%2FcEZnlK45Vo%2FdWLV1vOt%2FIpm3P1hZMHidy2TuWWq2YfkWVePHT4Q5lwRk%2FI6TFib8PofN5PM%2FxrS9SkmRUSzFeS5iGTwU%2FFQn7eL%2FVTuayfi6GfKHtrGe0lahkyTsOnJY3zUoOAWX7%2B6m3CiCvfLyR6Jfxb%2BRrkm4i%2FVK7sC3mmEU33Y0PDgBBj%2FkTIK3%2BNj3Dy0mfrC%2FiKyiHqnQs5Y5Mgb43CCg4qwDYPQjckT3fslbIDLpWm3DZsxyw%2B%2FzjqoGmV76xP1A%2BV2ueVar86fPNRM9gfpXI0aBbA09WUhWj4OaXb5ETaFpNVjv4IWTBLQryYy0sQkGC%2B2M2zXZaTzYeWXqOl0HBrWgpshZbaQIeWuu9AS%2F%2BZ8W%2F7UNI2hCRelv2gaTA0AQcQkvCtQiKKbLwwalie0w6jIlqs5DwIVyTLR0JyyFRrtVeujCnU4HJ20M2aeg1FwdrL5hsv5husT%2BkLs04v2eAmkUQMSGfznO6p2Mb7bfnDGrawhsitmkNkoLo5xApzCJB7uz1cOtZygT3HYVxf%2BvYMIENhHyWmkYA5u%2BVHmuZruqKxF305tj4xFMnMGR%2FDqDLhT5Lnu5Jz3paJC%2BPu4Rt%2BpZz7%2B%2FcIl6A%2FTj%2F8h3%2FZI%2BcEeQvzP%2FafDAYdis%2FFUws45effSBqyxSBpSUIxB074eTaxedJt6pOG1cFOGUxgWkFEvwJS1BmckojZ99fqiCpmlV1%2Fo2wvOwoGAE5VMgAWcRHxJQWtZb8j0z%2Blqbc7eS3hL2RnRjKF73IYCcFqVEDq4ZgyaR07IAdJYloQfRTaw0K2w3VifaeI66phiG%2FxKiVByL76W7yk%2BqIVkjXfEC%2FbpmTDxpkXYO2syZCN7QvbtFt1YRu3xwUhSWlOwrhTH99LF3S9C9h6kks2rdoz2668tFOPpZd3G8HLt1fQ5UXdhlmGi4ugptrDi3y6pl2ZE%2FrtRumMd5qBZQU0bKsujQpRthsyCF9bdVS8p2uSPRL6AZ8k%2BORKhsUBHCS0AlCWCAXeFFBQBsiHB0zXARxgWgpA07TkrQFN28VDcLG0ib0wl8g3F8CfAVMVnrkj%2FOSYsgJBZwx1Ylu06IGZSi5YtuNiP0DIhsRj1mkGbNgPzoTC4xBgDthI6JD4moKy25FmbSyrhJ76gKD1%2FoBgbyCwNfAbzn4fGiLpvG585v%2FDGEvGmLmsVfV2MVJYY%2BUZHJCdWy3hjGLPvLs9udYu2HW7UJuiZQ5kresWCdrTX1399tQANUjajzGVB5qZmqMqCgwyOnxmolN4dgsIUyibJhnpylnbkBhrYSlLR%2BqArfMdbpaEOlIXI95bEspgsPi7CATbaFAhsXrZSFyJqWbLfeQq1KzaySeJmn8nfpgw%2BSKnaSxaUDOnj1EUkMxPw2RPYreYabAtZ9amWwVdhypXoHPfeVgNKHeD%2ByJWeBo43mx5TmUU3oz9P6C0fCwoHf7MoEiJuQik7T6ANDLHsd0f93RdWzr0TTuwjSVkfwErYKjWVOzxeg75ugIBKOVKWfYFHGCfff%2F26ErjYk3fcDxT%2BvLE%2Fvu%2FDLYccxqTNHz18o%2BM43bbtClv00B1%2BqDKZgSWc%2Fs2XXfQrCm75DWrA0XxhtbjiYa9U2Kli9rFwLX41UiVvvCu2KaYs3EPk2qhKpuxq9dE1ueJx3FCeIBO%2FAjLsCro6dEx8IPWM60rZQL3c8YlMx1AQwLJmmJytYGEgWhCbABB92yPHgRSlMWMRSC5PGJJHjG6gzzqj62rmY5gVUraRna6SiOC0mmrYZyXRrnDDNtaZbGRC1N0Hxai4V%2B0gpcXNzoM7F9vw4F0vMiSgsR2TfljSpaEqYHPs9LY7D4VjgIvM1jSlIHPeP5CdsUE8%2FRiUYZ2cl7ZQgVzHgDjJCU02m1omqxDfziSDt7YCTnzfJf0PvDRw2IjJzQL%2Bf4xp0kYt40ITjCW5mIbepecNAICROw%2BnTSzhuxVp9IC%2F1eT7PsIplnvJmhSRNsnEDJJ94Rm0rFA%2B7qlokEUfI5e8cYRHakFsQE263qnDGLLiEiL3uFxZIMcgW8V9O5PKTXBW1EcNESlCpTyEIDrtswf1AEhsaru%2Fj2cTLTkKe6Fp8CqegJtHWYdHBXznKJ5PIB%2FXqM931%2BncFoh0so3mM4kf%2Fqdgdq%2FafF9%2BqsATxmN2pf7wuAVz0cq1x%2BeAPlWj3FilsB2F4ZxAbMslwT7fo%2BYRTpxBcJ3uHie00s5rig4nfRW%2BFwrCB%2FjNnHvGysm6N6Pw8sADKxUdRapcmVgX26G4hB2yqd5iukYCtzZkAlylzx0a9x%2B3fVuXTte3OvYYgYMuz9Hr3nuEzeGRZrRvAiddXYOzoTNDpjv4XgVTKuw1mnHVI7ojdP0jAMs1tN%2FcFu4aKBm9bt%2BJ0Sq6sf3EAxpSh8ZJhUfYLnM3B4yOWhkES7FnTx9MnUo8waw5Psh02jF5M6FW%2FJA3JBKUqM9CWkk5ToNMnRD6LvlztDXLU0yL105%2FV6b0EjoC1l9F%2Fsp7wKbGt76h7fSCLEmkcytGrKejJF7qxVT5VapGBqIqqZeFIN3SryYWnBkHLkPAEnIBRt1hKpMfTBdo3kzvB6h4iknqDclrA6EQm05u9SQ01N0GRt5JNdx%2BwYoI6ssVwGU482T4pNup0YlToPhX9mbhX1dXOBIUAZA5%2Fz1kbUeMwD7Rj%2FKZJGpoZ9vm%2BovXgyPf06uj2bmplvBdGGiuvUpTZg%2BnBSQJPTzuyElMXx7rNSILj%2FAU1fwhJF0sgRboycdiaOK%2B1eM%2BxrFRwPAqmHkpWsNlRpHc4mxuJi56GQAcV%2BHnuqOlrispxiALXvmLXOlFGauXj4kZRXouvLZETnIh5HM8ybYNGqZEV17ILNvEGm%2FL%2BfCboMGixQR%2FWjQwOajVD7UVrD18PJd4K%2FD5SujToKZIEIYxwEgMykSQrBEKfcpQlCdAGINAKF%2BLRccWyrEI7QrR4AMQqADhLjW%2Bmvf7Q6%2Fc3hgo4FbGV5FQa90UiiSU3Q70TJUEBT3d%2BUbHNk5JAefkmjt9xONZcOKG6oHvAEOOVjmcW%2FHzgp2q3JP78puBzoVft%2FO67ukURkSV6F95V5T%2BxmWluFgLeIx5SsDD9BL%2FCjs922SMOnTGCl70Fc2Ld%2BEPVS5tpfnnr%2FmoSc6kortE4o%2Bzg4HqJuWNyqRgXmxbPqKy7zZx%2BPPWhc71PHXweGX%2FwE%3D

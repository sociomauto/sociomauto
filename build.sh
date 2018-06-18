

# Add CLI Option to only compile specific application


echo ""
echo "====> Compiling sociomauto"
fpc -Fllib/linux-x86_64 -FEbin/ -FUtmp/ -O2 src/sociomauto.pas


#echo ""
#echo "====> Compiling testzmq"
#fpc -Fllib/ -FEbin/ -FUtmp/ -O2 -g src/testzmq.pas

#echo ""
#echo "====> Compiling modBroker"
#fpc -Fllib/ -FEbin/ -FUtmp/ -O2 -g src/modBroker.pas
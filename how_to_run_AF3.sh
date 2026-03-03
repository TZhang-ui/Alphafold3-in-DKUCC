###login
ssh your_netid@dkucc-login-01.rc.duke.edu
#then you need to enter your password

  eg.
   ssh tz141@dkucc-login-01.rc.duke.edu

###enter target folder

cd /work/your_netid
  eg.
   cd /work/tz141

#there should be two folders(AF3_Input and AF3_Output, if no, please create) and one script(run_AF3.sh,the script for running AF3)

### upload input files
cd AF3_Input
sftp user@ip (the server than contains your input files,远程登录后需要cd到储存输入文件的文件夹，但是注意这一步建议一个文件夹一个文件夹来，不能一步直接cd到目标文件夹，可能会出现连接问题)

get *json （upload all jsons files to AF3_Input)
exit(back to dkucc)

  
  eg.
   cd AF3_Input
   sftp test@10.200.20.112
     cd /u02
     cd tianyue
     cd AF3
     cd iput_files
     get *json
     exit



###run AF3
*still under AF3_Input

sbatch /work/your_netid/run_AF3.sh


###查看运行状态

*可以查看当前运行的所有项目及已运行时间
squeue


###查看结果
cd AF3_Output
*AF3的output folder以input json file当中的name为名字，共包含6个文件和5个文件夹，ptm和iptm结果在name_summary_confidences.json, 结构文件在name__model.cif



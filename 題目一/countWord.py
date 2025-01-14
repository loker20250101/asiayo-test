import re

def readFile(fileName):
    with open(fileName, "r") as f: # open file with read-only
        return f.read()

def replaceStr(data):
    return re.sub("\W+", " ", data)  # use a whitespace character to be replaced [^A-Za-z0-9_]+

def countWord(data):
    dataList = data.split() # convert to List
    dataList.sort() # sort

    word = ""
    count = 0
    dataDict = {}
    # statistic words
    for i in dataList:
        if word == "":
            word = i
            count = 1
            continue
        if word == i:
            count+=1
            continue
        if word != i:
            dataDict[word] = count
            word = i
            count = 1

    return dataDict

def top(dataDict):
    # print maximum duplicate words
    maxNum = 0
    for i in dataDict:
        if dataDict[i] > maxNum:
            maxNum = dataDict[i]
    for i in dataDict:
        if maxNum == dataDict[i]:
            print(f"{dataDict[i]} {i}")

def countTop(fileName):
    data = readFile(fileName).lower() # read context in lowercase
    reData = replaceStr(data)
    top(countWord(reData))

def __main():
    file = "words.txt"
    countTop(file)


# start
__main()
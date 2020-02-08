import sys

removeWords = {'Note:', 'Press', 'Code', 'unansweredUnanswered', '1', 'SubmitSome', 'Enter'}

assert(len(sys.argv) == 2)
with open(sys.argv[1]) as infile, open("clean_" + sys.argv[1], "w") as outfile:
    for line in infile:
        words = line.split()
        if len(words) > 0:
            if words[0] not in removeWords:
                outfile.write(line)
            if words[0].startswith("Submit"):
                outfile.write("\n\n")
        


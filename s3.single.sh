:

# See /home/stevei/.s3cfg

test -f ~/.s3cfg || {
    echo "Error: aws-shell not configured."
    echo "missing ~/.s3cfg"
    echo "YOU MUST ALSO RUN: aws config"
    exit 1
}

# echo Debug exit ; exit 0

DOMAIN=www.steveisaacson.com

# mirrorDIR=/usr/local/stevei/websites/faraim.org.mirror.s3
mirrorDIR=/run/media/stevei/plnkx/2019-github/steveisaacson.com


cd "$mirrorDIR" || {
    echo "Error: could not cd to: $mirrorDIR"
    exit 1
}

pwd

#
# aws-shell
#

# DRYRUN="--dryrun"
DRYRUN=""
DRYRUN="--dry-run"


# echo aws s3 sync ${DRYRUN} . s3://${DOMAIN}
# aws s3 sync --exclude="*" --include="contact.html" ${DRYRUN} . s3://${DOMAIN}


echo s3cmd ${DRYRUN} sync --exclude="*" --include="contact.html" . s3://${DOMAIN}
s3cmd ${DRYRUN} sync --exclude="*" --include="contact.html" . s3://${DOMAIN}
status=$?

echo Done

exit $status


about.html
contact.html
home.html
index.html
qsearch
sitemap.html


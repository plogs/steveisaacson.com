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
DRYRUN="--dry-run"
DRYRUN=""


#---------------------------------------------------------------------
#                       how-to do single page:
#---------------------------------------------------------------------
# echo s3cmd ${DRYRUN} sync --exclude="*" --include="contact.html" . s3://${DOMAIN}
# s3cmd ${DRYRUN} sync --exclude="*" --include="contact.html" . s3://${DOMAIN}
# status=$?


#---------------------------------------------------------------------
#                   this does ALL but exclude list
#---------------------------------------------------------------------

# --exclude-from=FILE
echo s3cmd ${DRYRUN} sync . s3://${DOMAIN}
# s3cmd ${DRYRUN} sync --exclude=".git/*" . s3://${DOMAIN}
s3cmd ${DRYRUN} sync  --acl-public --rexclude-from=.s3.exclude.RE . s3://${DOMAIN}

# --acl-public
status=$?

echo Done

exit $status


about.html
contact.html
home.html
index.html
qsearch
sitemap.html


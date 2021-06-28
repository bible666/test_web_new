<?php

/*
 | --------------------------------------------------------------------
 | App Namespace
 | --------------------------------------------------------------------
 |
 | This defines the default Namespace that is used throughout
 | CodeIgniter to refer to the Application directory. Change
 | this constant to change the namespace that all application
 | classes should use.
 |
 | NOTE: changing this will require manually modifying the
 | existing namespaces of App\* namespaced-classes.
 */
defined('APP_NAMESPACE') || define('APP_NAMESPACE', 'App');

/*
 | --------------------------------------------------------------------------
 | Composer Path
 | --------------------------------------------------------------------------
 |
 | The path that Composer's autoload file is expected to live. By default,
 | the vendor folder is in the Root directory, but you can customize that here.
 */
defined('COMPOSER_PATH') || define('COMPOSER_PATH', ROOTPATH . 'vendor/autoload.php');

/*
 |--------------------------------------------------------------------------
 | Timing Constants
 |--------------------------------------------------------------------------
 |
 | Provide simple ways to work with the myriad of PHP functions that
 | require information to be in seconds.
 */
defined('SECOND') || define('SECOND', 1);
defined('MINUTE') || define('MINUTE', 60);
defined('HOUR')   || define('HOUR', 3600);
defined('DAY')    || define('DAY', 86400);
defined('WEEK')   || define('WEEK', 604800);
defined('MONTH')  || define('MONTH', 2592000);
defined('YEAR')   || define('YEAR', 31536000);
defined('DECADE') || define('DECADE', 315360000);

/*
 | --------------------------------------------------------------------------
 | Exit Status Codes
 | --------------------------------------------------------------------------
 |
 | Used to indicate the conditions under which the script is exit()ing.
 | While there is no universal standard for error codes, there are some
 | broad conventions.  Three such conventions are mentioned below, for
 | those who wish to make use of them.  The CodeIgniter defaults were
 | chosen for the least overlap with these conventions, while still
 | leaving room for others to be defined in future versions and user
 | applications.
 |
 | The three main conventions used for determining exit status codes
 | are as follows:
 |
 |    Standard C/C++ Library (stdlibc):
 |       http://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
 |       (This link also contains other GNU-specific conventions)
 |    BSD sysexits.h:
 |       http://www.gsp.com/cgi-bin/man.cgi?section=3&topic=sysexits
 |    Bash scripting:
 |       http://tldp.org/LDP/abs/html/exitcodes.html
 |
 */
defined('EXIT_SUCCESS')        || define('EXIT_SUCCESS', 0); // no errors
defined('EXIT_ERROR')          || define('EXIT_ERROR', 1); // generic error
defined('EXIT_CONFIG')         || define('EXIT_CONFIG', 3); // configuration error
defined('EXIT_UNKNOWN_FILE')   || define('EXIT_UNKNOWN_FILE', 4); // file not found
defined('EXIT_UNKNOWN_CLASS')  || define('EXIT_UNKNOWN_CLASS', 5); // unknown class
defined('EXIT_UNKNOWN_METHOD') || define('EXIT_UNKNOWN_METHOD', 6); // unknown class member
defined('EXIT_USER_INPUT')     || define('EXIT_USER_INPUT', 7); // invalid user input
defined('EXIT_DATABASE')       || define('EXIT_DATABASE', 8); // database error
defined('EXIT_AUTO_MIN')      || define('EXIT_AUTO_MIN', 9); // lowest automatically-assigned error code
defined('EXIT_AUTO_MAX')      || define('EXIT_AUTO_MAX', 125); // highest automatically-assigned error code

define('DATE_FORMAT_YMDHMS','Y-m-d H:i:s');
define('MAX_LOGIN_COUNT',5);
define('MAX_LOCK_LOGIN_TIME_MINIUS',15);
define('TOKEN_LIVE_TIME_MINIUS',30);

define('HTML_STATUS_SUCCESS',200);
define('HTML_STATUS_DB_ERROR',502);
define('HTML_STATUS_UNAUTHORIZED',401);
define('TOKEN_NOT_FOUND',401);
define('YES','ได้');
define('NO','ไม่ได้');
define('SUSPECTED','มีโอกาศ');
define('NODOUBT','ปกติ');

define('AR_FRAA_ANS',[
    'faq01_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq02_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq03_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq04_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq05_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq06_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq07_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq08_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq09_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq10_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq11_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq12_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq13_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq14_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq15_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq16_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq17_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq18_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq19_answers' => [
        '0' => YES,
        '1' => NO
    ],
    'faq20_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq21_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq22_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq23_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq24_answers' => [
        '1' => YES,
        '0' => NO
    ],
    'faq25_answers' => [
        '1' => YES,
        '0' => NO
    ]
    
]);
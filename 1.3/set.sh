#!/bin/bash
#
# This file encrypted at Thu Dec 28 20:55:12 WIB 2023 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "/storage/emulated/0/download/setr.shdir" && rm -fr "/storage/emulated/0/download/setr.shdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir /storage/emulated/0/download/setr.shdir
fi || { (exit 127); exit 127; }

shctmp=/storage/emulated/0/download/setr.shdir/$0
case $0 in
-* | */*'
') mkdir -p "/storage/emulated/0/download/setr.sh" && rm -r "/storage/emulated/0/download/setr.sh";;
*/*) shctmp=/storage/emulated/0/download/setr.shdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase " Ciee nyari password <widyabakti02@gmail.com> | Rerechan02 admin fn_project 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" > "/storage/emulated/0/download/setr.sh"; then  umask $umask
  chmod 700 "/storage/emulated/0/download/setr.sh"
  (sleep 5; rm -fr "/storage/emulated/0/download/setr.shdir") 2>/dev/null &
  "/storage/emulated/0/download/setr.sh" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�
�`�0/ڸ��o<[�
@�2 �Kۢ	U$��ߐ��|��xv�H��h�k>eI���#&Cd<Vi�9aK�_� [L��D�Rl��"e?��B�/!�^ ��4�p�Gy�+�J��
]6��7�x+rT
���(��xv^Q�n> �����D�TbFl?�IX��R�W��ӣzښl���m#	d �}�����r�~�Wp!���n�
� ]�C/ >@��#�($L�Ġ�c�.��s/�����0��?[[�93'�г��t�e_��^�p
��:��<xK�
7~֫٤���v�����KZ.6���P����E>X�� �O(�Ҽ�eH2^d	�����*��aCK���!�2�90UA'��^��.Id"}��'��q5���Qu����$\L�O`�[u��aA W��AƦ��>D��q!
��p��L��<S��������D�e4�v�dk�_
ʫ��P�Z�"ݖ����>��`��U�pk�y���=~Iܜ������sO�~b�+�#B� �&�y
�������r1��w� ���R��V�ަ���A'oZiS@��"�Cm���j���󯆨�X�_]|0�q�(.�Y�a��ĕ/&�>���}32�|��Κp��d�O�i���J]��a��_�d�K��lE�E����+g�P޿�D��r�i������&����D�l���x���E�,�)\��8�0�]���ڂN�x{�=����zI��E��ԁ��@�u �@e\sW����d����%2Hj�����Y!�Ne3�����U��Y���)��JE�
��j�
U_)�E��bR��
�������ͅՏ���6ؤ���,��Q#m�IIۋ�~�J7r-�9�n�a�^u��=M)-+
��W3}��"f��҅ٜ��������Q?L�GI!#���|�������0�|D!Z+/�"���R���i�����i��"$)}}�b���KC�5���,4��*J��~�$y�,��b���f��܏ �r��S uS,��I�`R,�S�(M����ͫ��lJ#��H��s�'4��Ԫ�B�"�P'j�a�P��{!�Ҡ� �̵�3ˋ��e҄��ے����k41��-���"���ɍ��~GdU,�EN�s:ㄤ)h��i�8�\�yR�BB��4`Y�q�F@Ch����Aw`Z�����jV~�+{���?��8���iiʲ#ʝ�s�E�֛N��b�7 A�M�Ǩ@(�t��������=I�%��Y��ѯ�{�@�[?�(H`�9@���oZ�F/��C橅4k����Ô�Y��Kw`,8��=�����S9�Y���Y�s�FZ�e�ȗ��H����5��. �+L�]���T`+j�)Hq�V��$7i{�h�0wã�Z�8ms"�&$���.et&���r�?g�����q����.��Q��2����+_��M�� �O�n%df,�&�t��ҏ�M�9M�m��;����[���Gh�>�������n��E�C"�׬���
�Ɵ�6�̏V`����m�%�Q�ݴ�M�����oZ6����[l13'��~�'�W�%;�ؚ{u5�_�Z�O?pT+sN�o���_
��5q'���-.J���o{�'���o
�?�
7E�/��Ң�j��;�b�7%��n��
� 'ɕW����b?R�x�MuGfg6�g9��BA}�#�m�-p%f�0������Ӓ��6>(K� 8���[�~�~p������i������J7�� ]"2`��!(�Ӭ.�D���LېT����{��o� .۬�GN[4:�{\�k���i�ޏZ�غ�`�����쓉 |ac!�#MD8(�,fK�	3�jc���C��d>����P�m��J�v��ҡ�+H��}�M� �\�Ԥ�;�Ⓐ�^�v�t���y3'e��*\���G���/-Ckh~T��`�^]��|6S�5���;NC��| ���5��쓃�S��W�Nk!��)�_�t��ց �������ɤ���8�jyO[x�/��g��ї�f9��o�UB���*4��/gxA���j��5��U�.TrO�hw�4b���E��*���PZ��w��Œ*p�������k%�I�E��}���r���S�0
�[�'����:��]˔}�-M�<M�<dH��8���1��N�F��'c�Ce�����v���
&�ǊC��R��T��&�6����кb�:u�@>�d0���v���X��5+����ƪ�<��iZ�q#
�����)xFʠ�i%|)���*�����m�w��^ٚO��,�T���Y��*~j��'����U>�|T��
�92Ǔ��?����� �9����_�I�x�`�={A��'9��N��5����*��8�hQ�L3(*0�\Rn��P7�~7���:�/�p�|
�'�_d~,=0wj��@9O�ٮX�J�(��<�m*=!%�%�/+�xz�9������P����"����0�&�~h�t�������0�'N�����-�$"�zY�{n���2n��BkTC����M͒I[\�j��B_,�uˠ��(�y�_�7���H��vR�N	E��L��3�br�
a��3Z���^���O.��8��m�"I��Ob6����kW�F��YpJ�gȊ#�|�X�F���,�k��	Ѓ�3�3�w�3˰�@�\�b��c~2��nb) _Q̵���[�h��*`i׍v�z.���l���El�(U�I�a�����m�o��5��G�x���F�4���B�� ��ܭ�t�6�It	]-R�9�Gk�O��ȹc��$T>Ra�қ���]����P��G	u@�nU��v;��<������G�O����PU	\�d����F�'s/�bN|��a/�Xh�I\�GMn9kQXWf`^�=���$�o�'�������$oE���
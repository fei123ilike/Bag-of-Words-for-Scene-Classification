%test filter responses
 I = imread('sun_adpbjcrpyetqykvt.jpg');
 J = createFilterBank() ;
 K = extractFilterResponses(I, J);
 i = size(J,1);
 imshow(K(:,:,3*i),[]);